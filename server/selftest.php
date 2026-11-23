<?php
/**
 * VGZ Sea Battle server selftest (CLI).
 *
 * Runs the full protocol end to end against a throw-away SQLite database and
 * re-implements the CLIENT side of the obfuscation (aa.java from the
 * decompiled APK) to prove that the server answers are decodable:
 *
 *   php selftest.php
 *
 * Exit code 0 = all tests passed.
 */

declare(strict_types=1);

error_reporting(E_ALL);

$GLOBALS['SB_CONFIG_OVERRIDE'] = [
    'db_path' => __DIR__ . '/data/selftest.sqlite3',
    'log_file' => __DIR__ . '/data/selftest.log',
];

require_once __DIR__ . '/lib.php';

$failures = 0;
$checks = 0;

function check(bool $cond, string $what): void
{
    global $failures, $checks;
    $checks++;
    if ($cond) {
        echo "  PASS  $what\n";
    } else {
        $failures++;
        echo "  FAIL  $what\n";
    }
}

/* -------- client-side reimplementation (decompiled aa.java) -------- */

/** aa.a(int,String,String): caesar decode used by the game client. */
function client_decode_action(int $i, string $key, string $payload): string
{
    $seed = ord($key[$i]) - 48;
    $shift = (ord($key[$seed + 10]) % 9) + 1;
    $out = '';
    for ($j = 0, $n = strlen($payload); $j < $n; $j++) {
        $c = ord($payload[$j]);
        if ($c > 96) {
            $c -= $shift;
            if ($c < 97) {
                $c += 26;
            }
        }
        $out .= chr($c);
    }
    return $out;
}

/** aa.c(String): splash checksum of the stored data1.txt. */
function client_checksum(string $data1): string
{
    $key = substr($data1, 0, 10);
    $rest = substr($data1, 10);
    $out = '';
    $i = 0;
    for ($j = 0, $n = strlen($rest); $j < $n; $j++) {
        $sum = (ord($key[$i]) - 48) + (ord($rest[$j]) - 48);
        if ($sum > 9) {
            $sum -= 10;
        }
        $out .= (string) $sum;
        $i++;
        if ($i > 9) {
            $i = 0;
        }
    }
    return $out;
}

/** Builds a UID exactly like the ported client: seed(10) + check digits. */
function client_uid(string $seed10, string $computed): string
{
    return $seed10 . $computed;
}

/* ------------------------------- reset ------------------------------- */

@unlink(__DIR__ . '/data/selftest.sqlite3');
@unlink(__DIR__ . '/data/selftest.sqlite3-wal');
@unlink(__DIR__ . '/data/selftest.sqlite3-shm');
@unlink(__DIR__ . '/data/selftest.log');

echo "VGZ Sea Battle server selftest\n";

/* --------------------------- 1. register ----------------------------- */

$computed1 = '012345678901234';                       // arbitrary check digits
$uidA = client_uid('3456789012', $computed1);

$resp = sb_handle_register(['UID' => $uidA, 'login' => 'player1']);
check(str_starts_with($resp, '1000*'), "register returns 1000* (got: $resp)");
$data1A = substr($resp, 5);
check(client_checksum($data1A) === $computed1, 'data1 checksum matches client check digits');
check(strlen($data1A) > 10, 'data1 longer than the 10 digit key');

$resp2 = sb_handle_register(['UID' => $uidA, 'login' => 'player1']);
check($resp2 === $resp, 're-register same uid is idempotent');

$resp3 = sb_handle_register(['UID' => client_uid('9876543210', $computed1), 'login' => 'player1']);
check($resp3 === '3', 'taken login returns 3');

check(sb_handle_register(['UID' => $uidA, 'login' => '']) === '1', 'empty login returns 1');
check(sb_handle_register(['UID' => $uidA, 'login' => 'toolongloginname']) === '1', 'overlong login returns 1');
check(sb_handle_register(['UID' => $uidA, 'login' => 'bad_name']) === '1', 'non alnum login returns 1');
check(sb_handle_register(['UID' => 'short', 'login' => 'player2']) === '2', 'short uid returns 2');

/* ------------------------- 2. passwords ------------------------------ */

$uidP = client_uid('1122334455', $computed1);
$respP = sb_handle_register(['UID' => $uidP, 'login' => 'secretuser', 'password' => 'S3cret!pass']);
check(str_starts_with($respP, '1000*'), 'register with password succeeds');
$db = sb_db();
$row = sb_find_user_by_uid($uidP);
check($row !== null && $row['password_hash'] !== null, 'password hash stored');
check($row !== null && $row['password_hash'] !== 'S3cret!pass', 'password is NOT stored in plain text');
check($row !== null && password_verify('S3cret!pass', $row['password_hash']), 'password_verify accepts the right password');
check($row !== null && !password_verify('wrong', $row['password_hash']), 'password_verify rejects a wrong password');

$uidNoPass = client_uid('5566778899', $computed1);
sb_handle_register(['UID' => $uidNoPass, 'login' => 'nopassuser']);
$row2 = sb_find_user_by_uid($uidNoPass);
check($row2 !== null && $row2['password_hash'] === null, 'protocol-only user has no password (NULL hash)');

/* ------------------------- 3. get_next_page -------------------------- */

$respN = sb_handle_get_next_page(['UID' => $uidA]);
check(str_starts_with($respN, '1000*'), 'get_next_page returns 1000*');
$parts = explode('*', substr($respN, 5));
$key = $parts[0];
check(strlen($key) === 30, 'key has 30 digits');
check(count($parts) === 6, 'payload has key + 5 action segments');
$expectedActions = sb_config()['actions'];
$allOk = true;
foreach ([0, 1, 2, 3, 4] as $idx) {
    $decoded = client_decode_action($idx, $key, $parts[$idx + 1]);
    if ($decoded !== $expectedActions[$idx]) {
        $allOk = false;
        echo "        segment $idx decoded to '$decoded', expected '{$expectedActions[$idx]}'\n";
    }
}
check($allOk, 'all 5 segments decode to the configured activities');
check(sb_handle_get_next_page(['UID' => 'unknown-uid-value']) === '1', 'unknown uid returns 1');
check(sb_handle_get_next_page(['UID' => '']) === '1', 'empty uid returns 1');

/* ------------------------------ 4. top1 ------------------------------ */

$uidB = client_uid('6677889900', $computed1);
sb_handle_register(['UID' => $uidB, 'login' => 'player2']);

check(sb_handle_top1(['ID' => $uidA, 'Score' => '500']) === '1', 'first score ranks 1');
check(sb_handle_top1(['ID' => $uidB, 'Score' => '900']) === '1', 'higher score ranks 1');
check(sb_handle_top1(['ID' => $uidA, 'Score' => '800']) === '2', 'lower score ranks 2');
check(sb_handle_top1(['ID' => $uidA, 'Score' => '700']) === '3', 'lower repeat ranks by its own value (rank 3: 900, 800, 700)');
check(sb_handle_top1(['ID' => 'unknown', 'Score' => '100']) === '0', 'unknown id returns 0');
check(sb_handle_top1(['ID' => $uidA, 'Score' => 'x']) === '0', 'non numeric score returns 0');

$rowA = sb_find_user_by_uid($uidA);
check($rowA !== null && (int) $rowA['score'] === 800, 'best score stored (800)');
$rowB = sb_find_user_by_uid($uidB);
check($rowB !== null && (int) $rowB['score'] === 900, 'best score stored for player2 (900)');

/* --------------------------- 5. unregistered ------------------------- */

$respU = sb_handle_unregistered(['Unregistered' => '1']);
check(str_contains($respU, '***'), 'unregistered payload carries the *** marker');
$stripped = str_replace('***', '', $respU);
check($stripped === sb_config()['unregistered_action'], 'stripped payload is a valid action');

/* --------------------------- 6. persistence -------------------------- */

$path = sb_config()['db_path'];
check(file_exists($path), 'sqlite database file exists');
$size = filesize($path);
check($size > 0, "database non-empty ($size bytes)");

/* ------------------------------ summary ------------------------------ */

echo "\n$checks checks, $failures failures\n";
if ($failures === 0) {
    echo "ALL TESTS PASSED\n";
    exit(0);
}
echo "TESTS FAILED\n";
exit(1);

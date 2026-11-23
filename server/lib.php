<?php
/**
 * VGZ Sea Battle server library.
 *
 * Recreates the original vipgameszone protocol (decompiled y.java) on top of
 * SQLite3, with passwords stored hashed (password_hash, never plain):
 *
 *   register.php      POST UID=<seed+check> login=<name> [password=<secret>]
 *                     -> "1" login expected
 *                     -> "2" user id expected
 *                     -> "3" login already taken
 *                     -> "1000*<data1>"  (data1 = user id the client stores
 *                        in data1.txt; its checksum equals the client check)
 *   get_next_page.php POST UID=<seed+check>
 *                     -> "1" wrong user id
 *                     -> "1000*<key>*<enc(action0)>*<enc(action1)>... "
 *                        key = 30 digits; enc() is the client's caesar decode:
 *                        shift for segment i = (ord(key[key[i] + 10]) % 9) + 1
 *   top1.php          POST ID=<user id> Score=<score>
 *                     -> "0" unknown id, else the 1-based rank of the score
 *   unregistered.php  POST Unregistered=1
 *                     -> "<action>***"  (client strips "***" and starts it)
 *
 * The obfuscation math is a line-by-line reimplementation of the decompiled
 * aa.java; selftest.php verifies it end to end.
 */

declare(strict_types=1);

function sb_config(): array
{
    static $c = null;
    if ($c === null) {
        $c = require __DIR__ . '/config.php';
        if (isset($GLOBALS['SB_CONFIG_OVERRIDE']) && is_array($GLOBALS['SB_CONFIG_OVERRIDE'])) {
            $c = array_merge($c, $GLOBALS['SB_CONFIG_OVERRIDE']);
        }
    }
    return $c;
}

/** Opens the SQLite3 database (WAL) and makes sure the schema exists. */
function sb_db(): SQLite3
{
    static $db = null;
    if ($db === null) {
        $cfg = sb_config();
        $dir = dirname($cfg['db_path']);
        if (!is_dir($dir)) {
            mkdir($dir, 0770, true);
        }
        $db = new SQLite3($cfg['db_path'], SQLITE3_OPEN_CREATE | SQLITE3_OPEN_READWRITE);
        $db->enableExceptions(true);
        $db->exec('PRAGMA busy_timeout = 5000');
        $db->exec('PRAGMA journal_mode = WAL');
        $db->exec('PRAGMA foreign_keys = ON');
        sb_ensure_schema($db);
    }
    return $db;
}

function sb_ensure_schema(SQLite3 $db): void
{
    $db->exec(
        'CREATE TABLE IF NOT EXISTS users ('
        . ' id INTEGER PRIMARY KEY AUTOINCREMENT,'
        . ' login TEXT NOT NULL UNIQUE COLLATE NOCASE,'
        . ' uid TEXT NOT NULL UNIQUE,'
        . ' data1 TEXT NOT NULL DEFAULT "",'
        . ' password_hash TEXT,'
        . ' score INTEGER NOT NULL DEFAULT 0,'
        . ' created_at TEXT NOT NULL DEFAULT (datetime(\'now\')),'
        . ' updated_at TEXT NOT NULL DEFAULT (datetime(\'now\'))'
        . ')'
    );
    $db->exec(
        'CREATE TABLE IF NOT EXISTS score_log ('
        . ' id INTEGER PRIMARY KEY AUTOINCREMENT,'
        . ' user_id INTEGER NOT NULL REFERENCES users(id) ON DELETE CASCADE,'
        . ' score INTEGER NOT NULL,'
        . ' created_at TEXT NOT NULL DEFAULT (datetime(\'now\'))'
        . ')'
    );
    $db->exec('CREATE INDEX IF NOT EXISTS idx_users_score ON users(score DESC)');
}

function sb_log(string $message): void
{
    $cfg = sb_config();
    if (empty($cfg['log_file'])) {
        return;
    }
    try {
        $dir = dirname($cfg['log_file']);
        if (!is_dir($dir)) {
            mkdir($dir, 0770, true);
        }
        $ip = isset($_SERVER['REMOTE_ADDR']) ? $_SERVER['REMOTE_ADDR'] : 'cli';
        $script = isset($_SERVER['SCRIPT_NAME']) ? basename($_SERVER['SCRIPT_NAME']) : 'selftest';
        $line = date('Y-m-d H:i:s') . ' ' . $ip . ' ' . $script . ': ' . $message . PHP_EOL;
        file_put_contents($cfg['log_file'], $line, FILE_APPEND | LOCK_EX);
    } catch (Throwable $e) {
        // logging must never break the endpoint
    }
}

function sb_respond(string $body): void
{
    header('Content-Type: text/plain; charset=utf-8');
    header('Content-Length: ' . strlen($body));
    echo $body;
    exit;
}

/** trims a POST field, returns "" when missing. */
function sb_post(array $post, string $key): string
{
    if (!isset($post[$key]) || !is_scalar($post[$key])) {
        return '';
    }
    return trim((string) $post[$key]);
}

/* ------------------------------------------------------- protocol helpers */

/**
 * aa.c() from the decompiled code: first 10 chars are the digit key, every
 * following digit is summed with the cycling key digit mod 10.
 */
function sb_checksum(string $data1): string
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

/**
 * Builds the server-side user id (data1) for a client UID.
 * UID = <10 digit seed><client check digits>; data1 = <seed><rest digits> with
 * rest chosen so sb_checksum(data1) == <client check digits>. The splash then
 * verifies exactly like the decompiled r.java + MainActivity.a(String,String).
 */
function sb_make_data1(string $uid): string
{
    $seed = substr($uid, 0, 10);
    $computed = substr($uid, 10);
    $rest = '';
    for ($i = 0, $n = strlen($computed); $i < $n; $i++) {
        $d = ((ord($computed[$i]) - 48) - (ord($seed[$i % 10]) - 48) + 10) % 10;
        $rest .= (string) $d;
    }
    return $seed . $rest;
}

/** Random digit key long enough for any decode index (client needs key[i]+11). */
function sb_make_key(): string
{
    $key = '';
    for ($i = 0; $i < 30; $i++) {
        $key .= (string) random_int(0, 9);
    }
    return $key;
}

/**
 * Forward caesar for the client's decoder (aa.a(int,String,String)): only
 * chars above 96 (a-z) are shifted, everything else (digits, '.', capitals)
 * stays as-is. shift must be 1..9, like the client computes it.
 */
function sb_caesar_encode(string $action, int $shift): string
{
    $out = '';
    for ($i = 0, $n = strlen($action); $i < $n; $i++) {
        $c = ord($action[$i]);
        if ($c > 96) {
            $c += $shift;
            if ($c > 122) {
                $c -= 26;
            }
        }
        $out .= chr($c);
    }
    return $out;
}

/** Shift the client applies to segment $i of a get_next_page payload. */
function sb_shift_for(string $key, int $i): int
{
    $d = ord($key[$i]) - 48;
    return (ord($key[$d + 10]) % 9) + 1;
}

function sb_find_user_by_uid(string $uid): ?array
{
    $db = sb_db();
    $stmt = $db->prepare('SELECT * FROM users WHERE uid = :uid LIMIT 1');
    $stmt->bindValue(':uid', $uid, SQLITE3_TEXT);
    $row = $stmt->execute()->fetchArray(SQLITE3_ASSOC);
    return $row === false ? null : $row;
}

function sb_find_user_by_login(string $login): ?array
{
    $db = sb_db();
    $stmt = $db->prepare('SELECT * FROM users WHERE login = :login COLLATE NOCASE LIMIT 1');
    $stmt->bindValue(':login', $login, SQLITE3_TEXT);
    $row = $stmt->execute()->fetchArray(SQLITE3_ASSOC);
    return $row === false ? null : $row;
}

/* ------------------------------------------------------- endpoint bodies */

function sb_handle_register(array $post): string
{
    $uid = sb_post($post, 'UID');
    $login = sb_post($post, 'login');
    $password = sb_post($post, 'password');
    $maxLogin = (int) sb_config()['max_login_length'];

    sb_log('register: login=' . $login . ' uid=' . substr($uid, 0, 12) . '...');

    if ($login === '' || strlen($login) > $maxLogin || !preg_match('/^[A-Za-z0-9]+$/', $login)) {
        return '1'; // login expected (original client dialog: "Login expected")
    }
    if (strlen($uid) < 10) {
        return '2'; // user id expected
    }

    $existing = sb_find_user_by_uid($uid);
    if ($existing !== null) {
        // Same device registering again: keep the login stable and answer the
        // stored id (idempotent, matches the splash re-verification flow).
        if ($existing['login'] !== $login && sb_find_user_by_login($login) !== null) {
            return '3';
        }
        if ($password !== '') {
            sb_set_password((int) $existing['id'], $password);
        }
        sb_log('register: known uid -> id ' . $existing['id']);
        return '1000*' . $existing['data1'];
    }

    if (sb_find_user_by_login($login) !== null) {
        sb_log('register: login taken');
        return '3';
    }

    $data1 = sb_make_data1($uid);
    $hash = $password !== '' ? password_hash($password, PASSWORD_DEFAULT) : null;
    $db = sb_db();
    $stmt = $db->prepare(
        'INSERT INTO users (login, uid, data1, password_hash) VALUES (:login, :uid, :data1, :hash)'
    );
    $stmt->bindValue(':login', $login, SQLITE3_TEXT);
    $stmt->bindValue(':uid', $uid, SQLITE3_TEXT);
    $stmt->bindValue(':data1', $data1, SQLITE3_TEXT);
    $stmt->bindValue(':hash', $hash, SQLITE3_TEXT);
    $stmt->execute();
    $id = $db->lastInsertRowid();
    sb_log('register: created user ' . $id . ' login=' . $login . ' (hashed password: '
        . ($hash !== null ? 'yes' : 'none') . ')');
    return '1000*' . $data1;
}

function sb_handle_get_next_page(array $post): string
{
    $uid = sb_post($post, 'UID');
    sb_log('get_next_page: uid=' . substr($uid, 0, 12) . '...');
    if ($uid === '') {
        return '1'; // wrong user id
    }
    $user = sb_find_user_by_uid($uid);
    if ($user === null) {
        sb_log('get_next_page: unknown uid');
        return '1';
    }
    $key = sb_make_key();
    $parts = [$key];
    foreach (array_values(sb_config()['actions']) as $i => $action) {
        $parts[] = sb_caesar_encode($action, sb_shift_for($key, $i));
    }
    sb_touch((int) $user['id']);
    sb_log('get_next_page: id ' . $user['id'] . ' -> ' . (count($parts) - 1) . ' actions');
    return '1000*' . implode('*', $parts);
}

function sb_handle_top1(array $post): string
{
    $id = sb_post($post, 'ID');
    $scoreStr = sb_post($post, 'Score');
    $score = (int) $scoreStr;
    sb_log('top1: id=' . substr($id, 0, 12) . '... score=' . $score);
    if ($id === '' || !preg_match('/^[0-9]+$/', $scoreStr)) {
        return '0';
    }
    $user = sb_find_user_by_uid($id);
    if ($user === null) {
        sb_log('top1: unknown id');
        return '0';
    }
    $db = sb_db();
    if ($score > (int) $user['score']) {
        $stmt = $db->prepare('UPDATE users SET score = :score, updated_at = datetime(\'now\') WHERE id = :id');
        $stmt->bindValue(':score', $score, SQLITE3_INTEGER);
        $stmt->bindValue(':id', (int) $user['id'], SQLITE3_INTEGER);
        $stmt->execute();
    }
    $stmt = $db->prepare('INSERT INTO score_log (user_id, score) VALUES (:uid, :score)');
    $stmt->bindValue(':uid', (int) $user['id'], SQLITE3_INTEGER);
    $stmt->bindValue(':score', $score, SQLITE3_INTEGER);
    $stmt->execute();

    $stmt = $db->prepare('SELECT COUNT(*) AS better FROM users WHERE score > :score');
    $stmt->bindValue(':score', $score, SQLITE3_INTEGER);
    $row = $stmt->execute()->fetchArray(SQLITE3_ASSOC);
    $rank = (int) $row['better'] + 1;
    sb_log('top1: user ' . $user['id'] . ' rank ' . $rank);
    return (string) $rank;
}

function sb_handle_unregistered(array $post): string
{
    sb_log('unregistered: probe');
    return sb_config()['unregistered_action'] . '***';
}

function sb_touch(int $id): void
{
    $db = sb_db();
    $stmt = $db->prepare('UPDATE users SET updated_at = datetime(\'now\') WHERE id = :id');
    $stmt->bindValue(':id', $id, SQLITE3_INTEGER);
    $stmt->execute();
}

function sb_set_password(int $id, string $password): void
{
    $db = sb_db();
    $stmt = $db->prepare('UPDATE users SET password_hash = :hash WHERE id = :id');
    $stmt->bindValue(':hash', password_hash($password, PASSWORD_DEFAULT), SQLITE3_TEXT);
    $stmt->bindValue(':id', $id, SQLITE3_INTEGER);
    $stmt->execute();
}

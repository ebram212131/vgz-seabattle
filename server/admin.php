<?php
/**
 * VGZ Sea Battle - admin.php (token protected user management).
 *
 * POST admin_token=<token from config.php> action=<action> [login=... password=...]
 *
 * Actions (JSON answer):
 *   list      -> all users (login, uid, score, timestamps, has_password)
 *   stats     -> user count, best score, submissions count
 *   setpass   -> login + password, stores password_hash() of it
 *   clearpass -> login, removes the password (account becomes protocol-only)
 *   delete    -> login, removes the user and the score history
 *
 * Security: the token is compared with hash_equals; requests without a valid
 * token get HTTP 403. Passwords are only ever stored hashed.
 */

declare(strict_types=1);

require_once __DIR__ . '/lib.php';

$token = sb_post($_POST, 'admin_token');
$expected = (string) sb_config()['admin_token'];

if ($expected === '' || $expected === 'CHANGE-ME-to-a-long-random-string') {
    http_response_code(503);
    header('Content-Type: application/json; charset=utf-8');
    echo json_encode(['error' => 'admin token not configured, edit server/config.php']);
    exit;
}
if ($token === '' || !hash_equals($expected, $token)) {
    sb_log('admin: rejected (bad token)');
    http_response_code(403);
    header('Content-Type: application/json; charset=utf-8');
    echo json_encode(['error' => 'forbidden']);
    exit;
}

$action = sb_post($_POST, 'action');
$db = sb_db();

function sb_json(array $data): void
{
    header('Content-Type: application/json; charset=utf-8');
    echo json_encode($data, JSON_PRETTY_PRINT | JSON_UNESCAPED_SLASHES);
    exit;
}

switch ($action) {
    case 'list':
        $rows = $db->query(
            'SELECT id, login, uid, score, password_hash, created_at, updated_at'
            . ' FROM users ORDER BY score DESC, id ASC'
        );
        $users = [];
        while ($row = $rows->fetchArray(SQLITE3_ASSOC)) {
            $users[] = [
                'id' => (int) $row['id'],
                'login' => $row['login'],
                'uid' => $row['uid'],
                'score' => (int) $row['score'],
                'has_password' => $row['password_hash'] !== null,
                'created_at' => $row['created_at'],
                'updated_at' => $row['updated_at'],
            ];
        }
        sb_log('admin: list ' . count($users) . ' users');
        sb_json(['ok' => true, 'users' => $users]);
        break;

    case 'stats':
        $u = $db->querySingle('SELECT COUNT(*) FROM users');
        $b = $db->querySingle('SELECT MAX(score) FROM users');
        $s = $db->querySingle('SELECT COUNT(*) FROM score_log');
        sb_json(['ok' => true, 'users' => (int) $u, 'best_score' => (int) $b, 'submissions' => (int) $s]);
        break;

    case 'setpass':
        $login = sb_post($_POST, 'login');
        $password = sb_post($_POST, 'password');
        $user = $login !== '' ? sb_find_user_by_login($login) : null;
        if ($user === null) {
            sb_json(['ok' => false, 'error' => 'unknown login']);
        }
        if (strlen($password) < 4) {
            sb_json(['ok' => false, 'error' => 'password must have at least 4 characters']);
        }
        sb_set_password((int) $user['id'], $password);
        sb_log('admin: set password for ' . $login);
        sb_json(['ok' => true, 'login' => $login]);
        break;

    case 'clearpass':
        $login = sb_post($_POST, 'login');
        $user = $login !== '' ? sb_find_user_by_login($login) : null;
        if ($user === null) {
            sb_json(['ok' => false, 'error' => 'unknown login']);
        }
        $stmt = $db->prepare('UPDATE users SET password_hash = NULL WHERE id = :id');
        $stmt->bindValue(':id', (int) $user['id'], SQLITE3_INTEGER);
        $stmt->execute();
        sb_log('admin: cleared password for ' . $login);
        sb_json(['ok' => true, 'login' => $login]);
        break;

    case 'delete':
        $login = sb_post($_POST, 'login');
        $user = $login !== '' ? sb_find_user_by_login($login) : null;
        if ($user === null) {
            sb_json(['ok' => false, 'error' => 'unknown login']);
        }
        $stmt = $db->prepare('DELETE FROM users WHERE id = :id');
        $stmt->bindValue(':id', (int) $user['id'], SQLITE3_INTEGER);
        $stmt->execute();
        sb_log('admin: deleted user ' . $login);
        sb_json(['ok' => true, 'deleted' => $login]);
        break;

    default:
        sb_json(['ok' => false, 'error' => 'unknown action, use list|stats|setpass|clearpass|delete']);
}

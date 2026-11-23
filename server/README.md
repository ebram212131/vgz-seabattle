# VGZ Sea Battle Server (PHP + SQLite3)

A drop-in replacement for the dead `android.vipgameszone.com` backend, written
in plain PHP with a **SQLite3** database. It speaks the **exact wire protocol**
the original game speaks (recovered from the decompiled APK), and stores
passwords **hashed** (`password_hash`, bcrypt default) — never in plain text.

## Requirements

- PHP 7.4 or newer with the `sqlite3` extension (bundled by default)
- Apache (with `mod_authz_host`) or Nginx + PHP-FPM
- HTTPS recommended — the game client tries `https` first and only falls back
  to `http` when a TLS endpoint is unavailable

## Installation

1. Copy this `server/` folder to your web host, e.g. `/var/www/html/sea_battle/server`.
2. Make `data/` writable by the PHP user (`chown www-data:www-data data`).
   The SQLite database (`data/seabattle.sqlite3`) is created automatically.
3. **Edit `config.php`**: set a long random `admin_token`. Point `actions` at
   your package name if you rebuilt the app with a different application id.
4. Enable HTTPS (Let's Encrypt via certbot is free). HTTP keeps working as a
   fallback for hosts without TLS.
5. In the game: Settings → enable online mode → server address, e.g.
   `your-domain.com/sea_battle/server` (scheme optional; https is tried first).

## Wire protocol (byte compatible with the decompiled client)

All endpoints are POST with `application/x-www-form-urlencoded` bodies and
answer `text/plain`.

| Endpoint | POST params | Answers |
| --- | --- | --- |
| `register.php` | `UID`, `login` (optional `password`) | `1` login expected · `2` user id expected · `3` login taken · `1000*<data1>` |
| `get_next_page.php` | `UID` | `1` wrong user id · `1000*<key>*<enc(action0)>*…*<enc(action4)>` |
| `top1.php` | `ID`, `Score` | `0` unknown id · else the 1-based rank of the score |
| `unregistered.php` | `Unregistered=1` | `<action>***` (client strips `***` and starts the activity) |

`UID` = 10-digit seed + the client's device check digits (decompiled `v/w/x/aa`
pipeline). The server derives `data1` so that the splash checksum of `data1`
equals the client check digits — verified by `selftest.php`.

`<key>` is 30 random digits. Segment *i* is encoded with the caesar shift the
client computes in `aa.a(int,String,String)`: `shift = (key[key[i] + 10] % 9) + 1`
(only `a-z` shift; digits, `.` and capitals pass through).

## Passwords

The original protocol has no password field, and the ported game client does
not send one (login stays exactly like the decompiled version). The server
still supports hashed passwords:

- `register.php` accepts an optional `password` field — hashed with
  `password_hash(PASSWORD_DEFAULT)` before it touches the database.
- `admin.php` can set/clear passwords per user (`setpass`, `clearpass`).

```sh
# list users
curl -d "admin_token=YOURTOKEN&action=list" https://your-domain/sea_battle/server/admin.php

# set a password for a user (stored hashed)
curl -d "admin_token=YOURTOKEN&action=setpass&login=player1&password=s3cret" https://your-domain/sea_battle/server/admin.php

# stats
curl -d "admin_token=YOURTOKEN&action=stats" https://your-domain/sea_battle/server/admin.php
```

## Self test

```sh
php selftest.php
```

Runs the whole protocol against a throw-away database and re-implements the
CLIENT side of the obfuscation (decompiled `aa.java`) to prove the payloads
decode. 33 checks; exit code 0 = all good.

## Files

| File | Purpose |
| --- | --- |
| `config.php` | paths, admin token, activity actions |
| `lib.php` | schema, protocol helpers, endpoint bodies, logging |
| `register.php` / `get_next_page.php` / `top1.php` / `unregistered.php` | the four protocol endpoints |
| `admin.php` | token-protected user management (JSON) |
| `selftest.php` | CLI end-to-end test |
| `schema.sql` | reference schema (auto-created at runtime) |
| `data/` | SQLite database + server log (blocked from the web by `.htaccess`) |

## Privacy notes

- `users.uid` stores the device fingerprint the original protocol sent
  (timestamp seed + android_id derived digits + build-field lengths). No IMEI
  is collected: the ported client sends the same `"nullnull"` placeholder the
  decompiled code produced on modern Android without phone-state permission.
- `score_log` keeps one row per submission for ranking and abuse debugging.
- Delete a user (with its history) any time via `admin.php` `delete`.

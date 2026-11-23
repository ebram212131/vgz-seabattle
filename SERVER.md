# SERVER.md — VGZ Sea Battle server protocol & migration proposal

> **STATUS (v2.1):** Option A is IMPLEMENTED — `server/` in this repo contains a
> complete PHP + SQLite3 backend (hashed passwords, admin API, selftest).
> The client now tries **https first** and falls back to http, reports
> "Server is not reachable" with an Ok button instead of crashing, and logs
> everything to `Android/data/<package>/files/logs` (see `FileLogger.kt`).
> Deploy guide: `server/README.md`.

## 1. What the original client speaks (verified from decompiled y.java + RegisterApp.java)

All endpoints are `POST` with `application/x-www-form-urlencoded` bodies.
Base URL in the original client: `http://android.vipgameszone.com/sea_battle`
(the host is **dead** today — HTTP 000 from both `vipgameszone.com` and `www.`).
In this port the base URL is user-configurable (`Prefs.serverUrl`).

| Endpoint            | POST params (in order) | Used by                      |
|---------------------|------------------------|------------------------------|
| `register.php`      | `UID`, `login`         | RegisterApp submit step      |
| `get_next_page.php` | `UID`                  | after successful register    |
| `top1.php`          | `ID`, `Score`          | top-10 score submission      |
| `unregistered.php`  | `Unregistered=1`       | splash/first-run probe       |

### UID construction (client side, RegisterApp.b())

```
d   = reverse( currentTimeMillis string )[0..10)
uid = d
    + digitify( splice( imeiAndSim, d ) )   // modern port: imeiAndSim == "nullnull"
                                            //   (no '0' chars -> deterministic constant,
                                            //    identical to decompiled w.a(Context)
                                            //    when TelephonyManager returns null)
    + digitify( splice( androidId, d ) )
    + buildFingerprint()                     // concatenated lengths of 9 Build fields
```

`digitify` keeps digits and replaces every other char with its decimal char code;
`splice` fills filler chars into every `'0'` of the pattern, cycling the filler.

### Responses

- Registration (`register.php`): first `*`-separated token is a status code:
  - `1` → "Login expected"
  - `2` → "User ID expected"
  - `3` → "This login is already taken"
  - `1000` → success; the remainder (`1000*` stripped) is stored in `data1.txt`
  - anything else → "Unknown exception. Please try again"
- Next page (`get_next_page.php`): `1000*<key>*<enc(action0)>*<enc(action1)>…
  *<enc(action4)>` where the client decodes segment *i* with a Caesar shift of
  lowercase letters (shift = `(key[ key[i] + 10 ] % 9) + 1`) and starts an
  Activity whose **intent action** equals the decoded string. Segment 0 is the
  registration redirect (menu); segments 1..4 are the four menu buttons.
- `top1.php` returns the 1-based rank of the submitted score (`0` = unknown id;
  rank ≥ 11 also possible — the client picks the matching sound).
- `unregistered.php` returns `<action>***`; the splash strips `***` and starts
  the action directly (no Caesar, no `1000` marker — decompiled q.java).

## 2. What the server must do — minimal compatible backend

To make the bundled client work unchanged, a replacement server only needs:

1. `register.php` — store `(UID, login)`, enforce login charset `[A-Za-z0-9]`
   length ≤ 10 (client already validates), reply `1000*<seed10>` on success or
   `1/2/3*<anything>` on error.
2. `get_next_page.php` — verify UID, reply
   `1000*<seed>*<encoded("com.mygames.vgzseabattle.ActivityMenu")>` where
   `encoded(s)` shifts each lowercase letter **up** by the same rule the client
   shifts down. Any other action string (e.g. a different screen) also works.
3. `top1.php` — store `(ID, Score)` per player, return a top-10 listing.
4. `unregistered.php` — return whatever the splash flow expects (e.g. `1000*...`
   redirect or an empty marker; original behavior was a redirect payload).

A **reference implementation** of the client-side codec already exists and is
unit-tested in this repo: `core/ObfuscationCodec.kt` (+ `ObfuscationCodecTest`).
A server can be derived from it directly (shift direction inverted).

## 3. Proposals — Option A is now implemented

**Option A — drop-in legacy server: DONE (v2.1)**
`server/` holds the full PHP implementation: 4 endpoints byte-compatible with
the protocol above, **SQLite3** storage (WAL), **hashed passwords**
(`password_hash`), token-protected `admin.php` user management, `.htaccess`
protection for `data/`, and `selftest.php` (33 end-to-end checks incl. a
client-side re-implementation of the obfuscation). Deploy guide:
`server/README.md`.

**Option B — modern REST API (future)**
`POST /api/register {login}` → `{token}`, `GET /api/top10`, `POST /api/score`.
Cleaner, but requires a small client update (`RegistrationClient.kt` change +
tests). Can be added alongside A without breaking the legacy flow.

**Option C — offline leaderboard (already default)**
Online mode is off by default; the game fully works with the local top-10
(`sbs.txt` / `TopScores.kt`). Zero infrastructure.

## 4. Security notes (apply to any option)

- The original protocol is plain HTTP and the UID is a weak device fingerprint
  (timestamp + android_id). The shipped PHP server therefore also supports
  **hashed passwords** (optional `password` field / `admin.php` setpass), and
  the client tries **https first** (http only as fallback; explicit scheme in
  Settings is respected). Serve it over TLS.
- Rate-limit `register.php` and `top1.php` (429) — the client already treats
  any failure as unreachable and degrades gracefully.
- `data/` is blocked from the web by `.htaccess`; keep it outside the docroot
  on Nginx (`location /sea_battle/server/data { deny all; }`).

## 5. Hosting suggestions

| Host                          | Effort | Cost             | Fits      |
|-------------------------------|--------|------------------|-----------|
| Cloudflare Workers + D1       | low    | free tier        | A / B     |
| Cheap VPS + nginx + PHP+SQLite| low    | ~2–5 USD/month   | A         |
| Fly.io / Railway container    | medium | free-ish tier    | B         |
| Local LAN server for testing  | trivial| 0                | dev only  |

Tell me the option (and host) and I will build and hand over the server code in
the next step.

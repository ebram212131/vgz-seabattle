# VERIFICATION.md — port vs. decompiled original cross-check

Every row below was checked by re-reading the decompiled source
(`work/jadx-out/sources/com/mygames/vgzseabattle/` — same content as
`work/rea-evidence/*.txt`), not from memory. Line numbers refer to the jadx files.

| # | Rule / behavior | Original evidence (file:lines) | Port location | Status |
|---|-----------------|--------------------------------|---------------|--------|
| 1 | Hit score **+20** | ActivityGameScreen.java:744 `this.w += 20;` | SeaBattleEngine.kt:254 `score += 20` | MATCH |
| 2 | Sink score **+100** | ActivityGameScreen.java:788 `this.w += 100;` | SeaBattleEngine.kt:281 `score += 100` | MATCH |
| 3 | Own ship damaged **−10** | ActivityGameScreen.java:879 `this.w -= 10;` | SeaBattleEngine.kt:460 `score -= 10` | MATCH |
| 4 | Own ship sunk **−50** | ActivityGameScreen.java:920 `this.w -= 50;` | SeaBattleEngine.kt:291 `score -= 50` | MATCH |
| 5 | Fleet 1×4, 2×3, 3×2, 4×1 | placement calls with `nextInt(10-i)` and sizes 4..1 (ActivityGameScreen.java:211-218) | SeaBattleEngine.kt:29 `FLEET = intArrayOf(4,3,3,2,2,2,1,1,1,1)`, `placeOneShip` mirrors a/b/c/d | MATCH |
| 6 | AI focuses adjacent cell after a hit (up, down, left, right order) | ActivityGameScreen.java:830-845 (`n[u±1][v]==1`, `n[u][v±1]==1` → fire) | SeaBattleEngine.kt:380-401 `aiPickTargetAndFire` | MATCH |
| 7 | AI: 100 random attempts, then fallback scan | ActivityGameScreen.java:849-866 | SeaBattleEngine.kt:405-424 (fallback bug `n[u][v]==1` preserved on purpose, with comment) | MATCH |
| 8 | AI shot resolution: miss → state 4 + panned sound; hit → state 3, −10, full-volume sound | ActivityGameScreen.java:871-884 `v()` | SeaBattleEngine.kt:449-468 `resolveOpponentShot` | MATCH |
| 9 | Login validation: non-empty, ≤10 chars, `[A-Za-z0-9]`, original dialog texts | RegisterApp.java:38-55 | core/LoginValidator.kt (+ 13 tests in LoginAndRegistrationTest) | MATCH |
| 10 | Response codes 1/2/3/1000 with original error strings | RegisterApp.java:91-129 | RegisterApp.kt:143-179 | MATCH |
| 11 | 4 HTTP endpoints + param order (`UID,login` / `UID` / `ID,Score` / `Unregistered`) | y.java:13-75 | core/RegistrationClient.kt:31-42 | MATCH |
| 12 | Apache DefaultHttpClient → HttpURLConnection | y.java (org.apache.http.*) | HttpURLConnectionTransport (timeouts 5s/10s added, PORT-NOTE) | ADAPTED (Apache HTTP unavailable in compileSdk 35) |
| 13 | Obfuscation codec: all 8 members of aa.java | aa.java:1-81 | core/ObfuscationCodec.kt + 10 tests | MATCH — fixed this session: removed spurious `reverse()` in `decodeAction`; original builds the string forward |
| 14 | Device fingerprint: Build.* lengths + android_id (+ IMEI on old devices) | w.java:10-22, v.java:8-10 | DeviceIdentity.kt | ADAPTED (IMEI/SIM dropped — impossible on targetSdk 35, permission removed; documented) |
| 15 | File storage names `data0.txt`, `data1.txt`, `sbs.txt` (top-10) | x.java:29,64,92,124,152 | FileStore.kt (+ 9 tests) | MATCH |
| 16 | 56 sound effects | apktool-out/res/raw (56 wav) | app/src/main/res/raw (56 wav), packaged in APK (release path obfuscation identical to original build) | MATCH |
| 17 | Screen/menu ids and strings | apktool-out/res/layout, values/strings.xml (`app_name=VGZSeaBattle`) | res/ copied verbatim + `activity_settings.xml` added | MATCH |
| 18 | versionCode/versionName | original 2 / 1.1 | 3 / 2.0 (port bump, intentional) | UPDATED |
| 19 | Permissions | original 5 | 2 (`INTERNET`, `ACCESS_NETWORK_STATE`) — others dropped as product decision | UPDATED |
| 20 | App label | `VGZSeaBattle` | `VGZSeaBattle` | MATCH |
| 21 | Splash network probe thread (ag.b: connectivity + reachability, 3s/4s timeouts) | ag.java:11-33, s.java:14-29 | MainActivity.kt `probeServer`/`probeUrl` (probe accepts any HTTP status so custom PHP paths still count as reachable — documented deviation) | ADAPTED |
| 22 | Internet-error dialog with Ok button | MainActivity.java:66-73 + u.java | MainActivity.kt `showServerUnreachableDialog` — title now **"Server is not reachable"** (owner request), Ok continues to the menu instead of `finish()` | UPDATED (crash fix) |
| 23 | get_next_page flow at splash (r.java + t.java, `1000*` marker, checksum verify, decode action) | r.java:14-29, t.java:14-32, MainActivity.java:40-64,115-128 | MainActivity.kt `startVerification`/`verifyRegistration` — moved to worker thread (was crashing with NetworkOnMainThreadException on a slow/dead server) | MATCH + FIXED threading |
| 24 | Unregistered fallback at splash tick 7 (`***` marker, direct action start) | q.java:66-90 | MainActivity.kt SplashTicker tick==7 → `gateway.unregistered()` | MATCH |
| 25 | Registration screen (validation texts, UID build, data0/data1, register→get_next_page chain) | RegisterApp.java:26-176 + v/w/x/aa/ab/ac/ad/ae/af | RegisterApp.kt + DeviceIdentity.kt + FileStore.kt + core/LoginValidator.kt | MATCH |
| 26 | UID includes IMEI+SIM → modern devices yield `"null"+"null"` | w.java:14-18 (`String.valueOf(getDeviceId()) + String.valueOf(getSimSerialNumber())`) | DeviceIdentity.imeiAndSim() returns the same constant `"nullnull"` | FIXED (was `""` in earlier build) |
| 27 | Score submission: ID = data1 first segment, Score = last score; response rank int (0 fail, 1..10 in-top, ≥11 out) | j.java:13-31, ActivityMenu.java:222-225 | ActivityMenu.kt SendScoreTask | MATCH |
| 28 | Menu buttons ask server for next action (k.java multi-segment decode, indices 1..4) | k.java:14-30 | ActivityMenu.kt launchNextActivity (falls back to local actions offline) | MATCH |
| 29 | Server reachability failover **https first, http fallback** (owner request) | — (new) | core/ServerUrls.kt + core/OnlineGateway.kt + Prefs scheme cache (+ 16 tests) | NEW |
| 30 | "Server is not reachable" dialog + Ok button on splash and register screen (owner request) | — (new) | MainActivity.kt / RegisterApp.kt | NEW |
| 31 | File logging + crash reports in `Android/data/<package>/files/logs` (owner request) | — (new) | FileLogger.kt + VgzApp.kt (Application) + manifest `android:name` | NEW |
| 32 | PHP+SQLite3 server with hashed passwords (owner request) | — (new, server side) | server/*.php (register/get_next_page/top1/unregistered/admin/selftest, password_hash) — 33 selftest checks green, HTTP round-trip verified | NEW |

## Build / test status at packaging time (v2.1)

- Gradle **9.9.2**, AGP **9.5.2**, JDK 21 (`tools/jdk-21.0.13.1+2`).
- `:app:testDebugUnitTest` → **90 tests, 0 failures, 0 skipped**
  (SeaBattleEngine 27, ScoreSpeech 12, LoginAndRegistration 13, ObfuscationCodec 10,
  FileStore 9, TopScores 6, ServerUrls 8, OnlineGateway 5).
- `server/selftest.php` (PHP 8.2, SQLite3) → **33 checks, 0 failures**;
  HTTP round-trip via `php -S` + curl verified all 4 endpoints + admin.
- `:app:assembleRelease` → signed APK, `apksigner verify` OK
  (cert SHA-256 `053c3b76d26ce0b9da4ffe4b8d854b06af6a4181d2c7fa5dfaece1cd08ab2fe1`).
- APK contents checked with `aapt`: `res/raw` wavs present, permissions correct,
  label `VGZSeaBattle`, versionCode 4 / versionName 2.1.

## Known intentional deviations (all documented in code)

1. Account system optional + server URL configurable (`SettingsActivity`, `Prefs`).
2. `register.php`-launched menu redirect: when the account screen is opened from
   the menu, a successful registration just returns to the menu instead of
   force-restarting the flow (product change for the optional-account UX).
3. IMEI/SIM part of the UID is the constant `"nullnull"` (impossible to obtain
   without READ_PHONE_STATE on modern Android; equals the decompiled output on
   devices where TelephonyManager returns null — self-consistent client/server).
4. Apache HTTP replaced by HttpURLConnection; added timeouts (original had none).
5. Empty-filler guard in `ObfuscationCodec.splice` (original would throw on an
   empty IMEI string; modern port cannot produce that string).
6. Splash probe accepts any HTTP status (original required 200 from its portal
   root); a custom PHP path answering 301/403/404 still counts as reachable.
7. Network failures degrade: splash/register show "Server is not reachable"
   with Ok and continue offline; menu buttons fall back to local actions; score
   submit plays the failure sound. The process is never killed by a network error.

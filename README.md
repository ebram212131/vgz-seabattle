# VGZ Sea Battle — Kotlin port + PHP/SQLite3 server

A complete Kotlin rewrite of the Android game **VGZ Sea Battle**
(`com.mygames.vgzseabattle`, original versionCode 2 / versionName 1.1),
modernized for current Android (**minSdk 21, targetSdk 35, compileSdk 35**),
plus a drop-in **PHP + SQLite3** replacement for the (dead) original backend,
and all decompiled reference sources used for the port.

> This is a study / preservation project of an old free game whose online
> service no longer exists. The decompiled code and the original APK are kept
> for reference only. Rights holders can request removal via an issue.

## Features of the port (v2.2.2, versionCode 9)

- 100% Kotlin, no game-rule drift: scoring (+20 hit, +100 sink, −10 damaged,
  −50 own sunk), fleet `[4,3,3,2,2,2,1,1,1,1]`, AI focus/scan logic — every rule
  re-checked against the decompiled code (see [VERIFICATION.md](VERIFICATION.md)).
- Optional online account system (off by default) with a configurable server
  address in Settings; the game is fully playable offline.
- **Register honors the online checkbox (v2.2.2)**: with online mode off the
  Register screen explains how to enable the account system instead of timing
  out in silence; with online mode on the request shows an audible
  "sending" cue and an error cue if the server is unreachable.
- **TalkBack friendly**: real focusable buttons (double-tap to activate),
  audio-first feedback, no redundant screen-reader announcements.
- **Crash-safe networking**: the original crashed when its server died
  (`NetworkOnMainThreadException` in the splash flow). This port runs all
  network I/O on worker threads and reports **"Server is not reachable"** with
  an **Ok** button; Ok continues into the game menu offline.
- **HTTPS first**: scheme-less server addresses are tried with https, then
  http; the working scheme is remembered. An explicit scheme in Settings is
  respected as-is.
- **File logging**: everything (requests, failures, registration steps, score
  submissions) is appended to
  `Android/data/com.mygames.vgzseabattle/files/logs/vgz-log.txt`; uncaught
  exceptions additionally produce `crash-<timestamp>.txt` reports in the same
  folder (accessible via USB or a file manager, no adb needed).
- Login flow identical to the decompiled original: same validation dialogs,
  same protocol codes (`1` login expected, `2` user id expected, `3` taken,
  `1000` ok), same data0/data1 files, same obfuscated redirects.
- 93 unit tests (`:app:testDebugUnitTest`), all green.

## Repository layout

```
app/                  Kotlin Android project (Gradle 9.9.2 / AGP 9.5.2 / JDK 21)
  src/main/java/...   ported game (activities + core engine)
  src/main/res/raw/   the 56 original sound effects
  src/test/           90 JUnit tests
server/               PHP + SQLite3 backend (drop-in, see server/README.md)
  register.php / get_next_page.php / top1.php / unregistered.php
  admin.php           token-protected user management (hashed passwords)
  selftest.php        33 end-to-end protocol checks (CLI)
decompiled/           reference sources used for the port
  jadx-out/           decompiled Java (39 classes) + resources
  apktool-out/        decoded resources + original manifest
  rea-evidence/       per-class extracted evidence files
  rea-methods/        per-class method inventory
original-apk/         the original APK (MD5 c3d753211a4ff95cb40292cb00ba70d9)
SERVER.md             wire-protocol documentation
VERIFICATION.md       rule-by-rule cross-check table (original file:line ↔ port)
agents.md             working rules for agents/contributors
```

## Building

Requirements: JDK 17+, Android SDK 35 (Gradle wrapper downloads Gradle 9.9.2).

```sh
./gradlew :app:testDebugUnitTest      # 90 tests
./gradlew :app:assembleDebug          # debug APK
./gradlew :app:assembleRelease        # release APK (unsigned unless you add a keystore)
```

Release signing: place a PKCS12 keystore at `keystore/vgz-release.jks`
(alias `vgzseabattle`) with the passwords in `keystore/keystore-info.txt`
(`keyAlias=…`, `storePassword=…`, `keyPassword=…`) or pass
`-Pvgz.storePassword` / `-Pvgz.keyPassword` on the Gradle command line.
Neither the keystore nor the passwords are committed. The v2.2.2 keystore is
Google-Play compliant (RSA-2048, validity until 2056; use it as the Play App
Signing upload key). Without a keystore the release build assembles unsigned.
(The owner's signing key is kept private — releases on this repo are signed by
the owner and attached to GitHub Releases.)

## Server deployment

See [server/README.md](server/README.md). Short version:

1. Copy `server/` to any PHP 7.4+ host, make `server/data/` writable.
2. Set a random `admin_token` in `server/config.php`.
3. Enable TLS (the game tries https first).
4. In the game: Settings → online mode on → server address
   (`your-domain.com/sea_battle/server`, scheme optional).
5. `php server/selftest.php` to verify the deployment.

The server stores data in **SQLite3** (WAL mode) and stores passwords **hashed**
(`password_hash`); the game client itself keeps the original login-only flow.

## Protocol summary

`register.php` (`UID`,`login`) → `1`/`2`/`3`/`1000*<data1>` ·
`get_next_page.php` (`UID`) → `1000*<key>*<enc(action0)>…*<enc(action4)>` ·
`top1.php` (`ID`,`Score`) → rank ·
`unregistered.php` (`Unregistered=1`) → `<action>***`.
Full details and the obfuscation math: [SERVER.md](SERVER.md).

## Releases

Signed APKs are attached to [GitHub Releases](../../releases):
`VGZ-SeaBattle-2.2.2-release-signed.apk` (install this one) and a debug build.
Note: v2.2.2 ships a NEW signing key (Play-compliant). If a v2.2.1-or-older
build is installed, uninstall it first — Android refuses an update signed with
a different key.

## License

The port code, server code and documentation: MIT (see LICENSE).
The original game code, resources, sounds and APK remain the property of their
respective rights holders and are included here solely as reverse-engineering
reference for this study port.

# agents.md — VGZ Sea Battle Kotlin Port

> راهنمای کار برای هر ایجنت/دولوپری که روی این ریپو کار می‌کند.
> Guide for any agent or developer working on this repository.

## What this is

A 100% Kotlin port of the Android game **VGZ Sea Battle** (`com.mygames.vgzseabattle`,
original APK versionCode 2 / versionName 1.1), modernized for current Android
(minSdk 21, targetSdk 35, compileSdk 35) and built with **Gradle 9.9.2 + AGP 9.5.2 + JDK 21**.

Product decisions baked into this port (do not undo them without the owner's word):

1. **The online account system is OPTIONAL** — the whole game works fully offline.
2. The **server base URL is configurable** in Settings (`SettingsActivity` → `Prefs.serverUrl`).
   Default stays the historical `android.vipgameszone.com/sea_battle` (currently dead).
3. **No Prism / no TTS** — speech and feedback use only the 56 bundled `res/raw` wav files.
4. Permissions trimmed to `INTERNET` + `ACCESS_NETWORK_STATE`. The original's
   `READ_PHONE_STATE` (IMEI), `WRITE_EXTERNAL_STORAGE` and `KILL_BACKGROUND_PROCESSES`
   were dropped intentionally (modern Android anyway refuses them).
5. **Network failures never crash the app**: the client shows "Server is not
   reachable" with an Ok button and continues offline (owner request).
6. **HTTPS first**: scheme-less server addresses are tried with https, then http;
   the working scheme is remembered in `Prefs.KEY_SERVER_SCHEME`.
7. **Everything gets logged** to `Android/data/<package>/files/logs` (`FileLogger.kt`),
   including uncaught exceptions (crash-*.txt reports).
8. **Server side is PHP + SQLite3** in `server/` with hashed passwords
   (`password_hash`); deploy guide in `server/README.md`.

## Repository layout

```
vgz-seabattle/               ← THIS project
  agents.md                  ← you are here
  SERVER.md                  ← server protocol documentation (Option A implemented)
  VERIFICATION.md            ← port-vs-decompiled-source cross-check evidence
  keystore/vgz-release.jks   ← release signing key (PKCS12, NOT in the public repo)
  app/src/main/java/com/mygames/vgzseabattle/      ← ported app (Kotlin)
  app/src/main/java/com/mygames/vgzseabattle/core/ ← pure-JVM logic (engine, codec, protocol, gateway)
  app/src/main/res/          ← layouts, values, menu, 56 wav in res/raw
  app/src/test/java/com/mygames/vgzseabattle/core/ ← 90 unit tests (JUnit 4)
  server/                    ← PHP + SQLite3 backend (4 endpoints + admin + selftest)

work/                        ← reverse-engineering evidence (READ-ONLY inputs, do not edit)
  vgz-sea-battle.apk         ← original APK (MD5 c3d753211a4ff95cb40292cb00ba70d9)
  jadx-out/sources/com/mygames/vgzseabattle/   ← decompiled Java (39 classes)
  apktool-out/               ← decoded resources + original AndroidManifest
  rea-evidence/              ← rea-extracted per-class source files (40 files)
  rea-methods/               ← rea per-class method inventory
```

## Original class → port mapping

| Original (jadx)          | Kotlin port                                   |
|--------------------------|-----------------------------------------------|
| ActivityGameScreen.java  | ActivityGameScreen.kt + core/SeaBattleEngine.kt |
| a.java … h.java          | handler logic folded into engine listener flow  |
| ActivityMenu.java        | ActivityMenu.kt                                |
| MainActivity.java        | MainActivity.kt                                |
| ActivityViewTop.java     | ActivityViewTop.kt + core/TopScores.kt         |
| ActivityLearnSounds.java | ActivityLearnSounds.kt + Speaker.kt + core/ScoreSpeech.kt |
| ActivityLearnScreen.java | ActivityLearnScreen.kt                         |
| RegisterApp.java + ab–ag | RegisterApp.kt + core/LoginValidator.kt        |
| y.java (HTTP)            | core/RegistrationClient.kt + core/OnlineGateway.kt (https-first failover) |
| aa.java (obfuscation)    | core/ObfuscationCodec.kt                       |
| x.java (files)           | FileStore.kt                                   |
| w.java + v.java          | DeviceIdentity.kt (imeiAndSim = "nullnull")    |
| p.java (global state)    | GlobalState + SoundBoard.kt                    |
| i.java, z.java (sounds)  | SoundBoard.kt + Speaker.kt                     |
| grid/view id arithmetic  | GridIds.kt                                     |
| — (new)                  | SettingsActivity.kt + Prefs.kt                 |
| — (new)                  | FileLogger.kt + VgzApp.kt (logging + crash reports) |
| — (new)                  | core/ServerUrls.kt (scheme failover helpers)   |
| — (new, server)          | server/*.php (SQLite3 + password_hash + admin) |

## Build & test (exact commands)

```bash
JDK=/home/z/my-project/tools/jdk-21.0.13.1+2
GRADLE=/home/z/my-project/tools/gradle-dist/gradle-9.9.2/bin/gradle
cd /home/z/my-project/vgz-seabattle

# unit tests (AGP 9 has no testReleaseUnitTest; only debug variant exists)
JAVA_HOME=$JDK $GRADLE --no-daemon :app:testDebugUnitTest

# signed release APK  → app/build/outputs/apk/release/app-release.apk
JAVA_HOME=$JDK $GRADLE --no-daemon :app:assembleRelease

# verify signature
/home/z/my-project/tools/android-sdk/build-tools/35.0.0/apksigner \
  verify --print-certs app/build/outputs/apk/release/app-release.apk
```

- Gradle wrapper is pinned to **9.9.2** (`gradle/wrapper/gradle-wrapper.properties`).
- Signing: `keystore/vgz-release.jks`, alias `vgzseabattle`,
  store/key password `vgzseabattle2026` (PKCS12, RSA-2048, valid 30 years).
- Keep `JAVA_HOME` on the full JDK (the system `java` is a bare JRE without `javac`).

## Ground rules for agents

1. **Never change game logic from memory.** Before touching a rule (fleet, scoring,
   AI, sounds, protocol), re-read the matching file in `work/jadx-out/...` or
   `work/rea-evidence/` and quote it in the commit/PR description.
2. The rules verified so far are listed in `VERIFICATION.md` — keep that table
   up to date whenever you touch `SeaBattleEngine.kt` or `ObfuscationCodec.kt`.
3. Every behavior-level change needs a test in `app/src/test/`. The suite must
   stay green (`90/90` at the time of writing) and `server/selftest.php` must
   stay green too (`33/33`).
4. Keep `core/` free of `android.*` imports — it must stay plain-JVM testable.
5. Response codes of the registration protocol are part of the contract:
   `1` = Login expected, `2` = User ID expected, `3` = login taken, `1000` = OK.
   Do not rename them; see `SERVER.md` and `server/lib.php`.
6. Write user-facing chat replies in Persian (فارسی). Code, identifiers and docs
   stay English.
7. Keep all network calls off the main thread (worker threads only) — the
   original crash was a `NetworkOnMainThreadException` in the splash verify step.
8. Never write the keystore passwords or the server admin token into files that
   end up in the public repo (`keystore/` is git-ignored; `server/config.php`
   ships with a placeholder token).

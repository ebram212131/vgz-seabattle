plugins {
    id("com.android.application")
}

android {
    namespace = "com.mygames.vgzseabattle"
    compileSdk = 35

    defaultConfig {
        applicationId = "com.mygames.vgzseabattle"
        minSdk = 21
        targetSdk = 35
        versionCode = 10
        versionName = "2.2.3"
    }

    // Release signing is applied only when the keystore exists (it is NOT part
    // of the public repo). Passwords are NEVER hardcoded here (v2.2.2 removed
    // the old committed fallback): they come from -Pvgz.storePassword/-Pvgz
    // .keyPassword or from the git-ignored keystore/keystore-info.txt file
    // that travels with the keystore (see agents.md).
    signingConfigs {
        val ks = rootProject.file("keystore/vgz-release.jks")
        val info = rootProject.file("keystore/keystore-info.txt")
        fun ksValue(key: String, override: String?): String? =
            override ?: info.takeIf { it.exists() }?.readLines()
                ?.firstOrNull { it.trim().startsWith("$key=") }
                ?.substringAfter('=')?.trim()

        if (ks.exists()) {
            create("release") {
                storeFile = ks
                storePassword = ksValue("storePassword", project.findProperty("vgz.storePassword") as String?)
                    ?: error("Release keystore found but no password: set vgz.storePassword in keystore/keystore-info.txt or pass -Pvgz.storePassword")
                keyAlias = ksValue("keyAlias", project.findProperty("vgz.keyAlias") as String?) ?: "vgzseabattle"
                keyPassword = ksValue("keyPassword", project.findProperty("vgz.keyPassword") as String?)
                    ?: ksValue("storePassword", null)
            }
        }
    }

    buildTypes {
        release {
            isMinifyEnabled = false
            isDebuggable = false
            if (rootProject.file("keystore/vgz-release.jks").exists()) {
                signingConfig = signingConfigs.getByName("release")
            }
        }
    }
    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }
    testOptions {
        unitTests.isIncludeAndroidResources = false
        unitTests.isReturnDefaultValues = true
    }
    lint {
        checkReleaseBuilds = false
        abortOnError = false
    }
}

dependencies {
    testImplementation("junit:junit:4.13.2")
    testImplementation("org.jetbrains.kotlin:kotlin-test:2.2.10")
}

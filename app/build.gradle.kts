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
        versionCode = 5
        versionName = "2.1.1"
    }

    // Release signing is applied only when the keystore exists (it is NOT part
    // of the public repo). Locally: keystore/vgz-release.jks with the owner's
    // passwords (PKCS12, alias vgzseabattle). Without a keystore the release
    // build still assembles, just unsigned - see README.
    signingConfigs {
        val ks = rootProject.file("keystore/vgz-release.jks")
        if (ks.exists()) {
            create("release") {
                storeFile = ks
                storePassword = (project.findProperty("vgz.storePassword") as String?) ?: "vgzseabattle2026"
                keyAlias = "vgzseabattle"
                keyPassword = (project.findProperty("vgz.keyPassword") as String?) ?: "vgzseabattle2026"
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

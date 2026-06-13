pluginManagement {
    repositories {
        google()
        mavenCentral()
        gradlePluginPortal()
    }
}

plugins {
    // ✅ Android plugin
    id("com.android.application") version "8.3.1" apply false

    // ✅ Kotlin plugin (EZ adja a verziót!)
    id("org.jetbrains.kotlin.android") version "2.2.20" apply false

    // ✅ Google services (Firebase)
    id("com.google.gms.google-services") version "4.4.4" apply false
}

dependencyResolutionManagement {
    repositoriesMode.set(RepositoriesMode.FAIL_ON_PROJECT_REPOS)
    repositories {
        google()
        mavenCentral()
    }
}

rootProject.name = "mi_ketten"
include(":app")

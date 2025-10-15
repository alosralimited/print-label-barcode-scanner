// Ensure local.properties contains sdk.dir when ANDROID_SDK_ROOT or ANDROID_HOME is set
val localPropertiesFile = rootProject.file("local.properties")
val envSdk = System.getenv("ANDROID_SDK_ROOT") ?: System.getenv("ANDROID_HOME")
if (!localPropertiesFile.exists() && envSdk != null) {
    try {
        // normalize path separators to forward slashes which Android tooling accepts
        localPropertiesFile.writeText("sdk.dir=${envSdk.replace('\\','/')}\n")
    } catch (e: Exception) {
        println("Skipping local.properties update: ${e.message}")
    }
}

allprojects {
    repositories {
        google()
        mavenCentral()
    }
}

// Use default per-project build directories to comply with Gradle constraints.

tasks.register<Delete>("clean") {
    delete(rootProject.layout.buildDirectory)
}

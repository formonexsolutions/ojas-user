import org.gradle.api.tasks.Delete

buildscript {
    repositories {
        google()
        mavenCentral()
    }

    dependencies {
        classpath("com.android.tools.build:gradle:8.1.1")
        classpath("com.google.gms:google-services:4.4.3")
        classpath("org.jetbrains.kotlin:kotlin-gradle-plugin:1.9.10")
    }
}

//plugins {
//    id("com.android.application")
//    id("com.google.gms.google-services") version "4.4.3" apply false
//}

allprojects {
    repositories {
        google()
        mavenCentral()
    }
}

val newBuildDir: Directory = rootProject.layout.buildDirectory.dir("../../build").get()
rootProject.layout.buildDirectory.value(newBuildDir)

subprojects {
    val newSubprojectBuildDir: Directory = newBuildDir.dir(project.name)
    project.layout.buildDirectory.value(newSubprojectBuildDir)
}
subprojects {
    project.evaluationDependsOn(":app")
}


//tasks.register("clean", Delete::class) {
//    delete(rootProject.buildDir)
//}

//tasks.named<Delete>("clean") {
//    delete(rootProject.buildDir)
//}

tasks.register<Delete>("clean") {
    delete(rootProject.buildDir)
}
# Setup

## One-Time Install

Install these on both computers:

- Minecraft Java Edition
- IntelliJ IDEA Community Edition
- A current JDK that matches the Fabric version in this repo
- Git

The project includes `gradlew` and `gradlew.bat`, so nobody needs to install Gradle separately.

## Open The Project

1. Clone the GitHub repo.
2. Open the repo folder in IntelliJ.
3. Choose the Gradle import if IntelliJ asks.
4. Open IntelliJ settings and make sure Gradle uses the current JDK, not Java 8.
5. Run `gradlew runClient` from the terminal, or use the Gradle `runClient` task inside IntelliJ.

## First Smoke Test

When Minecraft opens:

1. Create a single-player creative world.
2. Open chat.
3. Run `/academy hello`.
4. Run `/academy quest`.

If both commands print messages, the development loop works.

## Build A Shareable Mod Jar

Run:

```powershell
.\gradlew.bat build
```

The mod jar appears in `build/libs`. Use the shorter jar name, not the `sources` jar.

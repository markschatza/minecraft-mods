# Setup

## One-Time Install

Install these on both computers:

- Minecraft Java Edition
- IntelliJ IDEA Community Edition
- A current JDK that matches the Fabric version in this repo
- Git

The project includes `gradlew` and `gradlew.bat`, so nobody needs to install Gradle separately.

## Automated Tool Install

The setup scripts check whether Git, Java, and IntelliJ IDEA Community Edition are already installed. They only try to install missing pieces.

They do not purchase or sign in to Minecraft. Minecraft Java Edition still needs to be bought and signed in separately on the computer that will run the game client.

### Windows

Open PowerShell in the repo folder and run:

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\setup-windows.ps1
```

The Windows script uses `winget`. If `winget` is missing, install App Installer from the Microsoft Store and run the script again.

After the script finishes, close and reopen PowerShell, then run:

```powershell
.\gradlew.bat -g .gradle-local --version
```

If Windows still finds Java 8 first, use the same `-g .gradle-local` option for the client run:

```powershell
.\gradlew.bat -g .gradle-local runClient
```

### Linux

Open a terminal in the repo folder and run:

```bash
chmod +x ./scripts/setup-linux.sh
./scripts/setup-linux.sh
```

The Linux script supports common package managers for Git, installs Eclipse Temurin JDK 25 into your home folder if needed, and installs IntelliJ through `snap` when available.

After the script finishes, close and reopen the terminal, then run:

```bash
./gradlew --version
```

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

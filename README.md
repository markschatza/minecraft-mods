# Northlight Academy Minecraft Mods

This repo is a beginner-friendly Fabric Minecraft mod project for learning Java by building tiny things in Minecraft.

It starts with one simple feature:

- `/academy hello` prints a welcome message in chat.
- `/academy quest` gives a random coding quest from Java code.

That is enough to practice editing Java, running Minecraft, seeing errors, fixing them, committing code, and sharing changes through GitHub.

## Quick Start

1. Install IntelliJ IDEA Community Edition.
2. Install the JDK required by the current Fabric template. The GitHub workflow uses Java 25.
3. Clone this repo from GitHub on each computer.
4. Open the folder in IntelliJ.
5. Let Gradle import the project.
6. Run `gradlew runClient` on Windows, or `./gradlew runClient` on macOS/Linux.
7. Create or open a world, then type `/academy quest`.

If `java -version` says Java 8, Minecraft modding will not build correctly. Install a current JDK and make sure IntelliJ uses it for Gradle.

## Learning Path

Start here:

- [Setup Guide](docs/SETUP.md)
- [First Lessons](docs/LESSONS.md)
- [Working Together With GitHub](docs/GITHUB_COLLAB.md)
- [Project Ideas](docs/PROJECT_IDEAS.md)

## Useful Links

- [Fabric developer docs](https://docs.fabricmc.net/develop/getting-started/index)
- [Fabric setup guide](https://docs.fabricmc.net/develop/getting-started/setting-up)
- [Official Fabric example mod](https://github.com/FabricMC/fabric-example-mod)
- [Fabric versions page](https://fabricmc.net/develop/)

## License

This project is based on the official Fabric example mod, which is CC0. You can learn from it, remix it, and build your own mods from it.

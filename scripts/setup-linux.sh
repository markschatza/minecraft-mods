#!/usr/bin/env bash
set -euo pipefail

MINIMUM_JAVA_MAJOR=25
JDK_DIR="${HOME}/.local/share/jdks/temurin-25"
PROFILE_FILE="${HOME}/.profile"

step() {
	printf '\n==> %s\n' "$1"
}

has_command() {
	command -v "$1" >/dev/null 2>&1
}

java_major_version() {
	if ! has_command java; then
		printf '0\n'
		return
	fi

	local line
	line="$(java -version 2>&1 | head -n 1)"

	if [[ "$line" =~ \"1\.([0-9]+) ]]; then
		printf '%s\n' "${BASH_REMATCH[1]}"
	elif [[ "$line" =~ \"([0-9]+) ]]; then
		printf '%s\n' "${BASH_REMATCH[1]}"
	else
		printf '0\n'
	fi
}

install_packages() {
	if has_command apt-get; then
		sudo apt-get update
		sudo apt-get install -y "$@"
	elif has_command dnf; then
		sudo dnf install -y "$@"
	elif has_command pacman; then
		sudo pacman -S --needed --noconfirm "$@"
	else
		printf 'No supported package manager found. Install these manually: %s\n' "$*"
		return 1
	fi
}

ensure_git() {
	step "Checking Git"
	if has_command git; then
		git --version
		return
	fi

	if has_command apt-get; then
		install_packages git
	elif has_command dnf; then
		install_packages git
	elif has_command pacman; then
		install_packages git
	fi
}

ensure_download_tools() {
	local missing=()

	has_command curl || missing+=(curl)
	has_command tar || missing+=(tar)

	if ((${#missing[@]} > 0)); then
		step "Installing download tools"
		install_packages "${missing[@]}"
	fi
}

ensure_java() {
	step "Checking Java"
	local major
	major="$(java_major_version)"

	if (( major >= MINIMUM_JAVA_MAJOR )); then
		printf 'Java %s is already available.\n' "$major"
		return
	fi

	printf 'Java %s was found, but this repo expects Java %s or newer.\n' "$major" "$MINIMUM_JAVA_MAJOR"
	ensure_download_tools

	step "Installing Eclipse Temurin JDK 25 in ${JDK_DIR}"
	mkdir -p "$JDK_DIR"

	local archive
	archive="$(mktemp)"
	curl -L --fail \
		"https://api.adoptium.net/v3/binary/latest/25/ga/linux/x64/jdk/hotspot/normal/eclipse" \
		-o "$archive"

	tar -xzf "$archive" --strip-components=1 -C "$JDK_DIR"
	rm -f "$archive"

	if ! grep -q "temurin-25" "$PROFILE_FILE" 2>/dev/null; then
		{
			printf '\n# Minecraft modding JDK\n'
			printf 'export JAVA_HOME="%s"\n' "$JDK_DIR"
			printf 'export PATH="$JAVA_HOME/bin:$PATH"\n'
		} >> "$PROFILE_FILE"
	fi

	export JAVA_HOME="$JDK_DIR"
	export PATH="$JAVA_HOME/bin:$PATH"

	java -version
}

ensure_intellij() {
	step "Checking IntelliJ IDEA Community Edition"

	if has_command idea || has_command intellij-idea-community || has_command idea.sh; then
		printf 'IntelliJ IDEA Community Edition appears to be installed.\n'
		return
	fi

	if has_command snap; then
		sudo snap install intellij-idea-community --classic
		return
	fi

	printf 'IntelliJ was not found, and snap is not installed.\n'
	printf 'Install IntelliJ IDEA Community Edition from https://www.jetbrains.com/idea/download/ and then open this repo.\n'
}

ensure_git
ensure_java
ensure_intellij

step "Done"
printf 'Close and reopen your terminal so new PATH entries are loaded.\n'
printf 'Then run: ./gradlew --version\n'
printf 'Minecraft Java Edition still needs to be purchased and signed in separately to run the game client.\n'

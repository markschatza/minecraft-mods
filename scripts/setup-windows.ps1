# Installs the basic Windows tools needed for this Minecraft modding repo.
# Run from PowerShell:
#   powershell -ExecutionPolicy Bypass -File .\scripts\setup-windows.ps1

$ErrorActionPreference = "Stop"

$MinimumJavaMajor = 25
$LocalGradleUserHome = Join-Path (Get-Location) ".gradle-local"

function Write-Step {
	param([string] $Message)
	Write-Host ""
	Write-Host "==> $Message" -ForegroundColor Cyan
}

function Test-Command {
	param([string] $Name)
	return $null -ne (Get-Command $Name -ErrorAction SilentlyContinue)
}

function Get-JavaMajorVersion {
	if (-not (Test-Command "java")) {
		return 0
	}

	$previousErrorActionPreference = $ErrorActionPreference
	$ErrorActionPreference = "Continue"
	$versionOutput = & java -version 2>&1
	$ErrorActionPreference = $previousErrorActionPreference

	$versionLine = ($versionOutput | Select-Object -First 1).ToString()

	if ($versionLine -match '"1\.(\d+)') {
		return [int] $Matches[1]
	}

	if ($versionLine -match '"(\d+)') {
		return [int] $Matches[1]
	}

	return 0
}

function Get-JavaMajorVersionFromPath {
	param([string] $JavaExe)

	if (-not (Test-Path $JavaExe)) {
		return 0
	}

	$previousErrorActionPreference = $ErrorActionPreference
	$ErrorActionPreference = "Continue"
	$versionOutput = & $JavaExe -version 2>&1
	$ErrorActionPreference = $previousErrorActionPreference

	$versionLine = ($versionOutput | Select-Object -First 1).ToString()

	if ($versionLine -match '"1\.(\d+)') {
		return [int] $Matches[1]
	}

	if ($versionLine -match '"(\d+)') {
		return [int] $Matches[1]
	}

	return 0
}

function Find-JdkHome {
	$roots = @(
		"$env:ProgramFiles\Eclipse Adoptium",
		"$env:ProgramFiles\Java",
		"$env:ProgramFiles\Microsoft",
		"${env:ProgramFiles(x86)}\Eclipse Adoptium",
		"${env:ProgramFiles(x86)}\Java"
	)

	$candidates = @()

	foreach ($root in $roots) {
		if (-not (Test-Path $root)) {
			continue
		}

		$candidates += Get-ChildItem -Path $root -Directory -Recurse -ErrorAction SilentlyContinue |
			Where-Object { Test-Path (Join-Path $_.FullName "bin\java.exe") }
	}

	foreach ($candidate in $candidates) {
		$javaExe = Join-Path $candidate.FullName "bin\java.exe"
		$major = Get-JavaMajorVersionFromPath $javaExe
		if ($major -ge $MinimumJavaMajor) {
			return $candidate.FullName
		}
	}

	return $null
}

function Convert-ToGradlePath {
	param([string] $Path)
	return $Path.Replace("\", "/").Replace(":", "\:")
}

function Set-ProjectGradleJavaHome {
	param([string] $JdkHome)

	New-Item -ItemType Directory -Force $LocalGradleUserHome | Out-Null

	$gradlePropertiesPath = Join-Path $LocalGradleUserHome "gradle.properties"
	$gradleJavaHome = Convert-ToGradlePath $JdkHome

	Set-Content -Path $gradlePropertiesPath -Value @(
		"# Local machine setting. Do not commit this file.",
		"org.gradle.java.home=$gradleJavaHome"
	)

	Write-Host "Configured Gradle to use: $JdkHome"
	Write-Host "Run Gradle with: .\gradlew.bat -g .gradle-local runClient"
}

function Install-WithWinget {
	param(
		[string] $Id,
		[string] $Name
	)

	Write-Step "Installing $Name"
	winget install --id $Id --exact --source winget --accept-package-agreements --accept-source-agreements
}

function Test-IntelliJInstalled {
	if (Test-Command "idea64") {
		return $true
	}

	$appPaths = @(
		"$env:LOCALAPPDATA\Programs\IntelliJ IDEA Community Edition\bin\idea64.exe",
		"$env:ProgramFiles\JetBrains\IntelliJ IDEA Community Edition\bin\idea64.exe",
		"${env:ProgramFiles(x86)}\JetBrains\IntelliJ IDEA Community Edition\bin\idea64.exe"
	)

	foreach ($path in $appPaths) {
		if (Test-Path $path) {
			return $true
		}
	}

	return $false
}

Write-Step "Checking winget"
if (-not (Test-Command "winget")) {
	throw "winget was not found. Install App Installer from the Microsoft Store, then run this script again."
}

Write-Step "Checking Git"
if (Test-Command "git") {
	git --version
} else {
	Install-WithWinget -Id "Git.Git" -Name "Git"
}

Write-Step "Checking Java"
$javaMajor = Get-JavaMajorVersion
if ($javaMajor -ge $MinimumJavaMajor) {
	Write-Host "Java $javaMajor is already available."
} else {
	Write-Host "Java $javaMajor was found, but this repo expects Java $MinimumJavaMajor or newer."
	Install-WithWinget -Id "EclipseAdoptium.Temurin.25.JDK" -Name "Eclipse Temurin JDK 25"
}

$jdkHome = Find-JdkHome
if ($null -eq $jdkHome) {
	Write-Host "Could not find a JDK $MinimumJavaMajor install yet. Close and reopen PowerShell, then run this script again."
} else {
	Set-ProjectGradleJavaHome $jdkHome
}

Write-Step "Checking IntelliJ IDEA Community Edition"
if (Test-IntelliJInstalled) {
	Write-Host "IntelliJ IDEA Community Edition appears to be installed."
} else {
	Install-WithWinget -Id "JetBrains.IntelliJIDEA.Community" -Name "IntelliJ IDEA Community Edition"
}

Write-Step "Done"
Write-Host "Close and reopen PowerShell so new PATH entries are loaded."
Write-Host "Then run: .\gradlew.bat -g .gradle-local --version"
Write-Host "Minecraft Java Edition still needs to be purchased and signed in separately to run the game client."

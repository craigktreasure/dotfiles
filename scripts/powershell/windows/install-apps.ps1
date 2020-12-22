#Requires -PSEdition Core

$ErrorActionPreference = "Stop"

$programsPath = Join-Path $PSScriptRoot 'programs'

. "$programsPath/scoop.ps1"
. "$programsPath/scoop-apps.ps1"
. "$programsPath/beyond-compare.ps1"
. "$programsPath/docker.ps1"
. "$programsPath/dotnet.ps1"
. "$programsPath/linqpad.ps1"
. "$programsPath/nuget-package-explorer.ps1"
. "$programsPath/powertoys.ps1"
. "$programsPath/teams.ps1"
. "$programsPath/vs-code.ps1"
. "$programsPath/windows-terminal.ps1"
. "$programsPath/visual-studio.ps1"
. "$programsPath/rust.ps1" # Rust can depend on msvc

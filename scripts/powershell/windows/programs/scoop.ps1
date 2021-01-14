#Requires -PSEdition Core

$ErrorActionPreference = "Stop"

# Setup Scoop: See https://scoop.sh/
Write-Host 'Installing Scoop...'
Invoke-Expression (New-Object System.Net.WebClient).DownloadString('https://get.scoop.sh')

# Setup Scoop aliases
. (Join-Path $PSScriptRoot 'scoop-aliases.ps1')

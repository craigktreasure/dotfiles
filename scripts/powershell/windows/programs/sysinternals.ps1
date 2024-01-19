#Requires -PSEdition Core

$ErrorActionPreference = "Stop"

. (Join-Path $PSScriptRoot '..' 'winget-helpers.ps1')

Write-Host 'Installing Sysinternals...' -ForegroundColor Magenta
Install-WingetPackageById '9P7KNL5RWT25'

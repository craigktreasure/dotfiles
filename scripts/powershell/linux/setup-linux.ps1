#Requires -PSEdition Core

Set-StrictMode -Version 1.0
$ErrorActionPreference = "Stop"

Write-Host 'Setting up Linux specific items...' -ForegroundColor Magenta

. (Join-Path $PSScriptRoot 'linux-variables.ps1')

if ($IsUbuntu -and $IsWsl) {
    [string] $wslInstallScriptPath = Resolve-Path (Join-Path $PSScriptRoot '..' '..' 'ubuntu' 'install-wsl-apps.sh')
    & $wslInstallScriptPath
}

Write-Host 'Setting up Linux items complete.' -ForegroundColor Green

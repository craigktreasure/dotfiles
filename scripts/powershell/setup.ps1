#Requires -PSEdition Core

Set-StrictMode -Version 1.0
$ErrorActionPreference = "Stop"

Write-Host 'Setting up additional configurations in PowerShell...' -ForegroundColor Magenta

. (Join-Path $PSScriptRoot 'configure.ps1')

if ($IsLinux) {
    . (Join-Path $PSScriptRoot 'linux' 'setup-linux.ps1')
}

Write-Host 'PowerShell configuration complete.' -ForegroundColor Green

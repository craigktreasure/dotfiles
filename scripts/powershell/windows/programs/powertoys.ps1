#Requires -PSEdition Core

$ErrorActionPreference = "Stop"

. (Join-Path $PSScriptRoot '..' 'winget-helpers.ps1')

Write-Host 'Installing PowerToys...' -ForegroundColor Magenta

if ($IsArm64) {
    Write-Warning 'Not available on ARM64.'
    return
}

$wingetId = 'Microsoft.PowerToys'

if (Test-WingetInstalledById $wingetId) {
    Write-Host 'Already installed.'
    return
}

winget install --id=$wingetId --exact

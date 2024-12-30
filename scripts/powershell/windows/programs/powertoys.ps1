#Requires -PSEdition Core

$ErrorActionPreference = "Stop"

. (Join-Path $PSScriptRoot '..' 'winget-helpers.ps1')

Write-Host 'Installing PowerToys...' -ForegroundColor Magenta

$wingetId = 'Microsoft.PowerToys'

if (Test-WingetInstalledById $wingetId) {
    Write-Host 'Already installed.'
    return
}

winget install --id=$wingetId --exact

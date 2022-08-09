#Requires -PSEdition Core

$ErrorActionPreference = "Stop"

. (Join-Path $PSScriptRoot '..' 'winget-helpers.ps1')

Write-Host 'Installing .NET 6 SDK...' -ForegroundColor Magenta

$wingetId = 'Microsoft.DotNet.SDK.6'

if (Test-WingetInstalledById $wingetId) {
    Write-Host 'Already installed.'
    return
}

winget install --id=$wingetId --exact

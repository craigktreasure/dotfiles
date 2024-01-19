#Requires -PSEdition Core

$ErrorActionPreference = "Stop"

. (Join-Path $PSScriptRoot '..' 'winget-helpers.ps1')

Write-Host 'Installing Windows Terminal...' -ForegroundColor Magenta

if (Test-WingetInstalledById $wingetId -or Test-WingetInstalledById 'Microsoft.WindowsTerminal') {
    Write-Host 'Already installed.'
    return
}

Install-WingetPackageById '9N0DX20HK701'

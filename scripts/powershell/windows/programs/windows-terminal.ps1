#Requires -PSEdition Core

$ErrorActionPreference = "Stop"

. (Join-Path $PSScriptRoot '..' 'winget-helpers.ps1')

Write-Host 'Installing Windows Terminal...' -ForegroundColor Magenta

# The MS Store package id
$wingetId = '9N0DX20HK701'

if (Test-WingetInstalledById $wingetId -or Test-WingetInstalledById 'Microsoft.WindowsTerminal') {
    Write-Host 'Already installed.'
    return
}


winget install --id=$wingetId --exact --source msstore

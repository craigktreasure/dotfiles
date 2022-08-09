#Requires -PSEdition Core

$ErrorActionPreference = "Stop"

. (Join-Path $PSScriptRoot '..' 'winget-helpers.ps1')

Write-Host 'Installing Beyond Compare...' -ForegroundColor Magenta

$wingetId = 'ScooterSoftware.BeyondCompare4'

if (Test-WingetInstalledById $wingetId) {
    Write-Host 'Already installed.'
    return
}

winget install --id=$wingetId --exact

# The silent install does allow you to opt out of the Clipboard Compare tool,
# so the tool is configured to run at logon and running after installation.
# We disable startup at logon and stop the process.

# Disable the Clipboard Compare tool from starting at logon.
Remove-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" -Name "BCClipboard"

# Stop the Clipboard Compare process.
Stop-Process -Name BCClipboard

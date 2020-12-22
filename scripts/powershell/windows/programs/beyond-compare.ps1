#Requires -PSEdition Core

$ErrorActionPreference = "Stop"

Write-Host 'Installing Beyond Compare...'

winget install --id=ScooterSoftware.BeyondCompare4 --exact

# The silent install does allow you to opt out of the Clipboard Compare tool,
# so the tool is configured to run at logon and running after installation.
# We disable startup at logon and stop the process.

# Disable the Clipboard Compare tool from starting at logon.
Remove-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" -Name "BCClipboard"

# Stop the Clipboard Compare process.
Stop-Process -Name BCClipboard

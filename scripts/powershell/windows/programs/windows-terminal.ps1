#Requires -PSEdition Core

$ErrorActionPreference = "Stop"

Write-Host 'Installing Windows Terminal...'

winget install --id=Microsoft.WindowsTerminal --exact --source msstore

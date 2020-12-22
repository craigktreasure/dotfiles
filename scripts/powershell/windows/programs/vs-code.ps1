#Requires -PSEdition Core

$ErrorActionPreference = "Stop"

Write-Host 'Installing Visual Studio Code...'

winget install --id=Microsoft.VisualStudioCode --exact

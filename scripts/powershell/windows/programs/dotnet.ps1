#Requires -PSEdition Core

$ErrorActionPreference = "Stop"

Write-Host 'Installing .NET SDK...'

winget install --id=Microsoft.dotnet --exact

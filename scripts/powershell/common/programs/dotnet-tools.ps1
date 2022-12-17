#Requires -PSEdition Core

$ErrorActionPreference = "Stop"

Write-Host 'Installing .NET Tools...'

dotnet tool install -g dotnet-outdated-tool
dotnet tool install -g nbgv
dotnet tool install -g slnup
dotnet tool install -g dotnet-suggest

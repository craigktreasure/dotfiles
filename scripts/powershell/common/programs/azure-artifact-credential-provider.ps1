#Requires -PSEdition Core

$ErrorActionPreference = "Stop"

Write-Host 'Installing Azure Artifact Credential Provider...'

# https://github.com/microsoft/artifacts-credprovider
Invoke-Expression "& { $(Invoke-RestMethod https://aka.ms/install-artifacts-credprovider.ps1) }"

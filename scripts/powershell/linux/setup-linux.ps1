#Requires -PSEdition Core

$ErrorActionPreference = "Stop"

Write-Host 'Setting up Linux specific items...' -ForegroundColor Magenta

. (Join-Path $PSScriptRoot 'linux-variables.ps1')

Write-Host 'Setting up Linux items complete.' -ForegroundColor Green

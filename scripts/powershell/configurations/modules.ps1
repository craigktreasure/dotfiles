#Requires -PSEdition Core

Set-StrictMode -Version 1.0
$ErrorActionPreference = "Stop"

Write-Host 'Installing PowerShell modules...' -ForegroundColor Magenta

if (-not (Get-InstalledModule -Name posh-git -ErrorAction SilentlyContinue)) {
    PowerShellGet\Install-Module posh-git -Scope CurrentUser -AllowPrerelease -Force
} else {
    Write-Host 'posh-git already installed.' -ForegroundColor Yellow
}

$ErrorActionPreference = "Stop"

. (Join-Path $PSScriptRoot '..' 'winget-helpers.ps1')

Write-Host 'Installing NuGet Package Explorer...' -ForegroundColor Magenta

# MS Store id
$wingetId = '9WZDNCRDMDM3'

if (Test-WingetInstalledById $wingetId) {
    Write-Host 'Already installed.'
    return
}

winget install --id=$wingetId --exact --source msstore --accept-package-agreements

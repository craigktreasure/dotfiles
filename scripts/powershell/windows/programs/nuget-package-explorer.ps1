#Requires -PSEdition Core

$ErrorActionPreference = "Stop"

Write-Host 'Installing NuGet Package Explorer...'

winget install --id=50582LuanNguyen.NuGetPackageExplorer --exact --source msstore

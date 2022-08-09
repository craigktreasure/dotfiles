#Requires -PSEdition Core

$ErrorActionPreference = "Stop"

. (Join-Path $PSScriptRoot '..' 'winget-helpers.ps1')

Write-Host 'Installing Visual Studio...' -ForegroundColor Magenta

if (Test-WingetInstalledByIdLike 'Microsoft.VisualStudio.2022.') {
    Write-Host 'Already installed.'
    return
}

# We override the arguments to add additional workloads and to wait using `--wait`
# so that the install command can wait for the installer to complete.
# See https://github.com/microsoft/winget-cli/issues/670.
winget install --id=Microsoft.VisualStudio.2022.Enterprise --exact --override "--productId Microsoft.VisualStudio.Product.Community --channelId VisualStudio.16.Release --channelUri https://aka.ms/vs/16/release/channel --add Microsoft.VisualStudio.Workload.Universal --add Microsoft.VisualStudio.Workload.NativeDesktop --add Microsoft.VisualStudio.Workload.ManagedDesktop --add Microsoft.VisualStudio.Workload.NetWeb --includeRecommended --wait --norestart --passive"

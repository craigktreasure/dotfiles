#Requires -PSEdition Core

$ErrorActionPreference = "Stop"

Write-Host 'Installing Visual Studio...'


# We override the arguments to add additional workloads and to wait using `--wait`
# so that the install command can wait for the installer to complete.
# See https://github.com/microsoft/winget-cli/issues/670.
winget install --id=Microsoft.VisualStudio.Community --exact --override "--productId Microsoft.VisualStudio.Product.Community --channelId VisualStudio.16.Release --channelUri https://aka.ms/vs/16/release/channel --add Microsoft.VisualStudio.Workload.Universal --add Microsoft.VisualStudio.Workload.NativeDesktop --add Microsoft.VisualStudio.Workload.ManagedDesktop --add Microsoft.VisualStudio.Workload.NetWeb --includeRecommended --wait --norestart --passive"

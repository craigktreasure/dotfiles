#Requires -PSEdition Core

$ErrorActionPreference = "Stop"

Write-Host 'Installing .NET Tools...'

dotnet tool install -g dotnet-outdated-tool
dotnet tool install -g nbgv
dotnet tool install -g slnup
dotnet tool install -g dotnet-suggest

# Fix dotnet-suggest to run on newer runtime versions
$dotnetSuggestRuntimeConfigPath = Join-Path $env:HOME '.dotnet\tools\.store\dotnet-suggest\1.1.415701\dotnet-suggest\1.1.415701\tools\net7.0\any\dotnet-suggest.runtimeconfig.json'
if (Test-Path $dotnetSuggestRuntimeConfigPath) {
    Write-Host 'Patching dotnet-suggest to run on newer runtime versions...'
    $json = Get-Content $dotnetSuggestRuntimeConfigPath | ConvertFrom-Json
    $json.runtimeOptions | Add-Member -MemberType NoteProperty -Name 'rollForward' -Value 'Major'
    Set-Content -Value (ConvertTo-Json $json -Depth 50) -Path $dotnetSuggestRuntimeConfigPath
}

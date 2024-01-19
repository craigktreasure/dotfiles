#Requires -PSEdition Core
#Requires -Modules common

$ErrorActionPreference = "Stop"

if (-not (Test-CommandExists scoop)) {
    throw "Scoop was not available."
}

Write-Host 'Configuring scoop buckets...' -ForegroundColor Magenta
scoop bucket add extras
scoop bucket add JetBrains https://github.com/Ash258/Scoop-JetBrains

Write-Host 'Installing scoop required apps...' -ForegroundColor Magenta
scoop install 7zip innounp dark

Write-Host 'Installing sysadmin scoop tools...' -ForegroundColor Magenta
scoop install sudo which grep gzip zip unzip `
              psutils wget mkcert `
              speedtest-cli bat less

Write-Host 'Installing development scoop apps...' -ForegroundColor Magenta
scoop install nuget vswhere dotpeek gh ilspy `
              notepadplusplus `
              msbuild-structured-log-viewer

Write-Host 'Installing extra scoop apps...' -ForegroundColor Magenta
scoop install windirstat dive

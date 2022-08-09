#Requires -PSEdition Core
#Requires -Modules common

$ErrorActionPreference = "Stop"

if (-not (Test-CommandExists scoop)) {
    throw "Scoop was not available."
}

Write-Host 'Configuring scoop buckets...'
scoop bucket add extras
scoop bucket add github-gh https://github.com/cli/scoop-gh.git
scoop bucket add java
scoop bucket add jetbrains

Write-Host 'Installing scoop required apps...'
scoop install 7zip innounp dark

Write-Host 'Installing sysadmin scoop tools...'
scoop install sudo which grep gzip zip unzip `
              psutils wget mkcert `
              speedtest-cli bat less

Write-Host 'Installing development scoop apps...'
scoop install nuget vswhere dotpeek gh ilspy `
              cmake llvm notepadplusplus `
              msbuild-structured-log-viewer `
              zulu8-jdk zulu11-jdk zulu-jdk codetrack

Write-Host 'Installing extra scoop apps...'
scoop install cpu-z mediainfo hwmonitor git-sizer `
              windirstat bulk-rename-utility mp3tag filezilla vlc `
              win32-disk-imager winmerge

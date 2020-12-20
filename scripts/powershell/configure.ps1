#Requires -PSEdition Core

Set-StrictMode -Version 1.0
$ErrorActionPreference = "Stop"

$configurationsPath = Join-Path $PSScriptRoot 'configurations'

. (Join-Path $configurationsPath 'modules.ps1')
. (Join-Path $configurationsPath 'git.ps1')
. (Join-Path $configurationsPath 'my-profile.ps1')

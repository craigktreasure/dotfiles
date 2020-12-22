#Requires -PSEdition Core

$ErrorActionPreference = "Stop"

Write-Host 'Installing LINQPad 6...'

winget install --id=LINQPad.LINQPad6 --exact

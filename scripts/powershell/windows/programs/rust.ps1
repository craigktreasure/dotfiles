#Requires -PSEdition Core
#Requires -Modules common

$ErrorActionPreference = "Stop"

Write-Host 'Installing Rust...'
$rustupPath = Start-DownloadWithRetry -Url 'https://win.rustup.rs/x86_64' -Name 'rustup-init.exe'

& $rustupPath -y --default-toolchain=stable

Append-ToPath (Join-Path $HOME '.cargo' 'bin')

rustup component add rustfmt clippy
cargo install cbindgen cargo-audit cargo-outdated

#!/bin/bash -e

sudo apt-get install -y build-essential libssl-dev pkg-config

curl https://sh.rustup.rs -sSf | sh -s -- -y --default-toolchain=stable

source $HOME/.cargo/env

rustup component add rustfmt clippy
cargo install bindgen cbindgen
cargo install cargo-audit
cargo install cargo-outdated

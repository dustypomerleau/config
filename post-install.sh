#!/bin/bash

# Intel macs only: BEFORE running any nix installation or post-install script,
# boot into recovery (cmd + R) and set your firmware password 

# - seed the PRNG before enabling FileVault
# - cat > /dev/random
# - (type random stuff for a long while)
# - Control-D
#
# will error if already enabled
echo 'enabling FileVault'
sudo fdesetup enable

# make sure /Library/TeX/texbin is added to your PATH (should be automatic).
# for annual updates that jump a major year/version you need `brew cask reinstall mactex`.
echo 'configuring tlmgr default repository'
sudo tlmgr option repository http://mirrors.rit.edu/CTAN/systems/texlive/tlnet

echo 'configuring aws to use endpoint plugin'
aws configure set plugins.endpoint awscli_plugin_endpoint

echo 'forcing hibernation and destruction of filevault keys in memory'
sudo pmset -a destroyfvkeyonstandby 1
sudo pmset -a hibernatemode 25

echo 'disabling powernap and standby for compatibility with FV key eviction'
sudo pmset -a autopoweroff 0
sudo pmset -a powernap 0
sudo pmset -a standby 0
sudo pmset -a standbydelay 0

echo 'disabling sudden motion sensor given it is useless with SSDs'
sudo pmset -a sms 0

echo 'making the crash reporter into a notification instead of a dialog'
defaults write com.apple.CrashReporter UseUNC 1

echo 'showing hidden app icons in the dock'
defaults write com.apple.dock showhidden -bool true
killall Dock

echo 'changing the default banner time for notifications (requires logout to activate)'
defaults write com.apple.notificationcenterui bannerTime 10

echo 'enabling text selection in finder quick look'
defaults write com.apple.finder QLEnableTextSelection -bool TRUE

echo 'enabling drag-lock for the trackpad'
# only drag-lock is not addressed by nix in system.defaults.trackpad
defaults write com.apple.AppleMultitouchTrackpad DragLock -bool true

echo 'installing xcode command line tools'
xcode-select --install

# TODO: if you actually need this postgres install, arrange proper config
# echo 'creating the default postgres user "postgres"'
# /run/current-system/sw/bin/postgres/bin/createuser -s postgres

echo 'initializing rustup'
rustup-init

# NOTE: miri is not available on stable
echo 'adding components to stable'
rustup component add \
    clippy \
    rust-analyzer \
    rust-docs \
    rust-src

echo 'adding nightly toolchain'
rustup toolchain install nightly --component \
    clippy \
    miri \
    rust-analyzer \
    rust-docs \
    rust-src

echo 'setting nightly as default'
rustup default nightly

echo 'adding wasm target for rust'
rustup target add \
    wasm32-unknown-unknown \
    wasm32-wasi

echo 'installing binaries only available via `cargo-install`'
cargo binstall rimage crates-tui

echo 'improving rust compilation times by enabling developer mode'
spctl developer-mode enable-terminal

#!/bin/bash

# todo: system.defaults.CustomSystemPreferences and CustomUserPreferences may fix some of your post-install script

echo 'changing default shell to fish'
chsh -s $(which fish)

echo 'softlinking ApplicationSupport'
ln -s ~/Library/Application\ Support ~/Library/ApplicationSupport

echo 'forcing hibernation and destruction of filevault keys in memory'
sudo pmset -a destroyfvkeyonstandby 1
# sudo pmset -a hibernatemode 25 # changed back to 3 for convenience, but key will only be evicted when set to 25

echo 'disabling powernap and standby for compatibility with FV key eviction'
# sudo pmset -a autopoweroff 0 # does not apply on your laptop
sudo pmset -a powernap 0
sudo pmset -a standby 1
sudo pmset -a standbydelayhigh 3600 # seconds until memory is powered off
sudo pmset -a standbydelaylow 600 # seconds
sudo pmset -a highstandbythreshold 30 # 30% battery remaining

echo 'disabling sudden motion sensor given it is useless with SSDs'
sudo pmset -a sms 0

echo 'making the crash reporter into a notification instead of a dialog'
defaults write com.apple.CrashReporter UseUNC 1

echo 'changing the default banner time for notifications (requires logout to activate)'
defaults write com.apple.notificationcenterui bannerTime 10

echo 'enabling text selection in finder quick look'
defaults write com.apple.finder QLEnableTextSelection -bool TRUE

echo 'enabling drag-lock for the trackpad'
# only drag-lock is not addressed by nix in system.defaults.trackpad
defaults write com.apple.AppleMultitouchTrackpad DragLock -bool true

echo 'installing xcode command line tools'
xcode-select --install

echo 'installing binaries only available via `cargo-install`'
cargo binstall rimage crates-tui

echo 'installing fisher to ensure post-install hook'
curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher

# install spectre_oxi (after installing nvim plugins)
cd ~/.local/share/nvim/lazy/nvim-spectre
./build.sh nvim-oxi
# for reference, on darwin this basically just does:
# cd spectre_oxi
# cargo build --release
# cp target/release/libspectre_oxi.dylib ../lua/spectre_oxi.so

echo 'adding SSH keys to agent'
ssh-add --apple-use-keychain ~/.ssh/id_ed25519

echo 'setting up touchID as sudo'
sudo cp /etc/pam.d/sudo_local.template /etc/pam.d/sudo_local
sudo nvim /etc/pam.d/sudo_local
# then add:
# auth       sufficient     pam_tid.so

# copy your NvimLauncher.app to /Applications/ on your new machine
# This is simply applescript to run a shell script, which contains:
#
# for f in "$@"
# do
# 	alacritty -e nvim "$f"
# done
#
# if you get PATH errors first run:
# PATH=/run/current-system/sw/bin:/opt/homebrew/bin:$PATH

# Set keybindings for Mission Control (switch spaces with ctrl + alt N/E)
# Set application keybinding for Fill (cmd + shift F)

# see notes in tmux.conf for ensuring you have working undercurl/colors in tmux

# manually add your terminal to System Settings > Privacy & Security > Developer Tools

# In Arq setup, import your excludes from ~/.config/arq/yyyymmdd-arq-mp-backup-exclusions.json 

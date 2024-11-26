#!/bin/bash

# todo: system.defaults.CustomSystemPreferences and CustomUserPreferences may fix most of your post-install script

# 2024-11-21 commenting all steps not needed on 2024 MBP

# Intel macs only: BEFORE running any nix installation or post-install script,
# boot into recovery (cmd + R) and set your firmware password 

# - seed the PRNG before enabling FileVault
# - cat > /dev/random
# - (type random stuff for a long while)
# - Control-D
#
# will error if already enabled
# echo 'enabling FileVault'
# sudo fdesetup enable

echo 'changing default shell to fish'
chsh -s $(which fish)

# make sure /Library/TeX/texbin is added to your PATH (should be automatic).
# for annual updates that jump a major year/version you need `brew cask reinstall mactex`.
# echo 'configuring tlmgr default repository'
# sudo tlmgr option repository http://mirrors.rit.edu/CTAN/systems/texlive/tlnet

# todo: set up secrets and version control the contents of ~/.aws
# then delete this, as it's handled by the config file     
# echo 'configuring aws to use endpoint plugin'
# aws configure set plugins.endpoint awscli_plugin_endpoint

echo 'softlinking ApplicationSupport'
ln -s ~/Library/Application\ Support ~/Library/ApplicationSupport

echo 'forcing hibernation and destruction of filevault keys in memory'
sudo pmset -a destroyfvkeyonstandby 1
# sudo pmset -a hibernatemode 25 # changed back to 3 for convenience, but use 25 for better battery life

echo 'disabling powernap and standby for compatibility with FV key eviction'
# to be clear, FV keys will not be evicted until standbydelay is met - set standby to 0 and hibernatemode to 25 if you want to skip standbydelay and just evict
# you may need to play with these values to get the right compromise between battery life and convenience
#
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

# echo 'showing hidden app icons in the dock'
# defaults write com.apple.dock showhidden -bool true
# killall Dock

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

# # this enables macOS Terminal.app, but you should manually add Alacritty in System Settings > Privacy & Security > Developer Tools
# echo 'improving rust compilation times by enabling developer mode'
# spctl developer-mode enable-terminal

echo 'installing fisher to ensure post-install hook'
curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher

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

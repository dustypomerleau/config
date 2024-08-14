#!/bin/bash

# todo: review macos defaults and determine which are already written by nix-darwin

# - seed the PRNG before enabling FileVault
#   cat > /dev/random
#   (type random stuff for a long while)
#   Control-D
echo 'enabling FileVault'
sudo fdesetup enable

echo 'installing xcode command line tools'
xcode-select --install

echo 'creating the postgres user "postgres"'
/usr/local/opt/postgres/bin/createuser -s postgres

echo 'adding wasm target for rust'
rustup target add wasm32-unknown-unknown wasm32-wasi

# make sure /Library/TeX/texbin is added to your PATH (should be automatic).
# for annual updates that jump a major year/version you need `brew cask reinstall mactex`.
sudo tlmgr option repository http://mirrors.rit.edu/CTAN/systems/texlive/tlnet

echo 'improving rust compilation times by enabling developer mode'
spctl developer-mode enable-terminal

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

echo 'changing default location for screenshots and removing dropshadow'
defaults write com.apple.screencapture location ~/Pictures/screenshots
defaults write com.apple.screencapture disable-shadow -bool TRUE
killall SystemUIServer

echo 'making the crash reporter into a notification instead of a dialog'
defaults write com.apple.CrashReporter UseUNC 1

echo 'reducing the use of transparency in OS X'
defaults write com.apple.universalaccess reduceTransparency -bool true

echo 'disabling sudden motion sensor given it is useless with SSDs'
sudo pmset -a sms 0

echo 'showing hidden app icons in the dock'
defaults write com.apple.dock showhidden -bool true
killall Dock

echo 'changing the default banner time for notifications (requires logout to activate)'
defaults write com.apple.notificationcenterui bannerTime 10

echo 'enabling text selection in finder quick look'
defaults write com.apple.finder QLEnableTextSelection -bool TRUE
echo 'showing all file extensions'
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

echo 'hiding icons on the desktop'
defaults write com.apple.finder CreateDesktop -bool false
echo 'showing the path bar in finder windows'
defaults write com.apple.finder ShowPathbar -bool true
killall Finder # required by all above

echo 'enabling tap to click, drag-lock AND three-finger drag for Apple trackpads'
defaults write com.apple.AppleMultitouchTrackpad Clicking -bool true
defaults write com.apple.AppleMultitouchTrackpad Dragging -bool true
defaults write com.apple.AppleMultitouchTrackpad DragLock -bool true
defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerDrag -bool true

fisher install patrickf1/colored_man_pages.fish


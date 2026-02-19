# Dusty's config

My dotfiles make use of `nix-darwin`, but from a Nix standpoint, my approach is impure.

The basic steps to provision a new machine are:

1. Power on the machine and go through initial macOS setup.
1. Backup `~/.config`.
1. Clone this repo and rename to `~/.config`.
1. Check the current default for `system.stateVersion` and update the value.
1. Install [Homebrew](https://brew.sh/) via `/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"`.
1. Run the [Lix](https://lix.systems/) installer via `curl -sSf -L https://install.lix.systems/lix | sh -s -- install` (or use the [Determinate Systems Nix installer](https://github.com/DeterminateSystems/nix-installer)).
1. Manually give full disk access to the terminal you're using via `System Settings > Privacy & Security > Full Disk Access` (this is necessary to set `universalaccess` settings like `reduceTransparency`).
1. Edit the variables in `~/.config/nix-darwin/flake.nix`.
1. Perform initial install with `nix run nix-darwin --experimental-features "nix-command flakes" -- switch --flake ~/.config/nix-darwin --impure`.
1. Subsequent changes are activated via `darwin-rebuild switch --flake ~/.config/nix-darwin --impure`.
1. Run `post-install.sh` to set system settings not available via nix-darwin.
1. Manually (ouch) install any GUIs not available via Nix, Homebrew, or the Mac App Store.
1. Manually (ouch) adjust settings for GUIs not configured by Nix.
1. Update the packages with `nix flake update --flake ~/.config/nix-darwin`, followed by `darwin-rebuild switch`, as above.

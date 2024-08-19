# Dusty Pomerleau's config

My dotfiles make use of `nix-darwin`, but from a Nix standpoint, my approach is impure.
The reasons for that are explained in the [Rationale](#rationale) section.

The basic steps to provision a new machine are:

1. Power on the machine and go through initial macOS setup.
1. Intel macs only: Reboot into recovery with cmd-R, and set a firmware password.
1. Backup `~/.config`.
1. Clone this repo and rename to `~/.config`.
1. [Install Homebrew](https://brew.sh/).
1. Run the [Determinate Systems Nix installer](https://github.com/DeterminateSystems/nix-installer).
1. Manually give full disk access to the terminal you're using via `System Settings > Privacy & Security > Full Disk Access` (this is necessary to set `universalaccess` settings like `reduceTransparency`).
1. Edit the variables in `~/.config/nix-darwin/flake.nix` to reflect your username, system, etc.
1. Perform initial install with `nix run nix-darwin --experimental-features "nix-command flakes" -- switch --flake ~/.config/nix-darwin --impure`.
1. Subsequent changes are activated via `darwin-rebuild switch --flake ~/.config/nix-darwin --impure`.
1. Run `post-install.sh` to set system settings not available via nix-darwin.
1. Manually (ouch) install any GUIs not available via Nix, Homebrew, or the Mac App Store.
1. Manually (ouch) adjust settings for GUIs not configured by Nix.
1. Update the packages with `nix flake update ~/.config/nix-darwin`, followed by `darwin-rebuild switch`, as above.
1. Lix can be updated by editing the input URL in `~/.config/nix-darwin/flake.nix`.

## Rationale

Everyone has their own solutions to machine setup: atomic operating systems, NixOS, containers.
We have a lot of tooling aimed at helping to set up a 'development environment,' but there is much less tooling aimed at setting up the entire computer.

- Atomic operating systems are focused more on allowing rollbacks than initial setup.
- NixOS solves the setup problem, but introduces significant hardware/driver obstacles that aren't present on macOS.
- Containers don't handle GUIs and OS/desktop settings very well (nor are they native on macOS).

The biggest hurdle is getting GUIs installed and configured:

- Some GUIs are available as Nix packages
- Some GUIs are available as Homebrew casks
- Some GUIs are only available on the Mac App Store
- Some GUIs are not available via any of the above methods
- Only a small subset of the GUIs store settings in a text file

Given all of the above, a truly reproducible environment is not going to be possible on macOS.
Because of that, my approach is to avoid the indexing/Spotlight pain that comes from installing GUIs in a special `Nix Apps` directory, and instead default to installing via Homebrew casks, allowing these apps to update themselves.

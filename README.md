# Dusty Pomerleau's config

This is a pragmatic approach to adding Nix to macOS via nix-darwin.
Because of the way macOS handles GUI applications and system settings, it is effectively impossible to have a pure system derivation on macOS.
The approach I'm currently taking is to manage plain packages via Nix, and GUI applications via Nix-managed Homebrew.
Only some of the GUI applications are problematic when installed via Nix, but the cognitive overhead is less if all of the GUIs are in one place.
In addition, some system settings are not available in nix-darwin, so it is necessary to either manually adjust these, or run a shell script that sets them.
Although config files for apps like Neovim can be translated into nix, I think this only makes sense if they are the only reason your derivation is impure.
In my case, there are many other reasons the derivation can never be pure, so I keep my Neovim config in Lua, Fish config in Fish, etc.

The basic approach to a new machine is:

1. Power on the machine and go through initial macOS setup.
1. Reboot into recovery with cmd-R, and set a firmware password.
1. Clone this repo, and copy the files into `~/.config`.
1. Run the [Determinate Systems Nix installer](https://github.com/DeterminateSystems/nix-installer)
1. Manually give full disk access to the terminal you're using via `System Settings > Privacy & Security > Full Disk Access` (this is necessary to set `universalaccess` settings like `reduceTransparency`.
1. Perform initial install with `nix run nix-darwin -- switch --flake ~/.config/nix-darwin`.
1. Subsequent changes are activated via `darwin-rebuild switch --flake ~/.config/nix-darwin --impure`.
1. Run `post-install.sh` to set system settings not available via nix-darwin.
1. Manually (ouch) adjust settings for any GUIs not configured by Nix.

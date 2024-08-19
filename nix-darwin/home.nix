{ specialArgs, ... }:
{
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = specialArgs;

    users.${specialArgs.username} = {
      home = {
        username = specialArgs.username;
        homeDirectory = "/Users/${specialArgs.username}";

        # Pulling config files in like this is impure, but it allows symlinking everything into `.config/`.
        # If you want a pure solution, you need to rewrite your configs in nix.
        #
        # For example: https://github.com/chrisportela/dotfiles,
        # which also contains an example of using secrets.
        #
        # Or: https://github.com/gvolpe/neovim-flake
        # used by https://github.com/gvolpe/nix-config
        file = {
          ".cargo/config.toml".source = /Users/${specialArgs.username}/.config/cargo/config.toml;
          ".gitconfig".source = /Users/${specialArgs.username}/.config/git/.gitconfig;
          ".gitignore_global".source = /Users/${specialArgs.username}/.config/git/.gitignore_global;
          ".psqlrc".source = /Users/${specialArgs.username}/.config/postgres/.psqlrc;
          ".ssh/config".source = /Users/${specialArgs.username}/.config/ssh/config;
          ".zshrc".source = /Users/${specialArgs.username}/.config/zsh/.zshrc;
          "/Library/ApplicationSupport/Code/User/keybindings.json".source = /Users/${specialArgs.username}/.config/code/keybindings.json;
          "/Library/ApplicationSupport/Code/User/settings.json".source = /Users/${specialArgs.username}/.config/code/settings.json;
          "/Library/ApplicationSupport/jj/config.toml".source = /Users/${specialArgs.username}/.config/jj/config.toml;
          "/Library/ApplicationSupport/org.dystroy.broot/conf.toml".source = /Users/${specialArgs.username}/.config/broot/conf.toml;
          "themes.gitconfig".source = /Users/${specialArgs.username}/.config/git/themes.gitconfig;
        };

        packages = [ ]; # packages installed only for this user (unlike `environment.systemPackages`)
        stateVersion = "23.11";
      };

      # Let Home Manager install and manage itself.
      programs.home-manager.enable = true;
      # Neovim, Tmux, Fish, etc. are enabled in systemPackages instead of home.programs,
      # because I want to keep the config files in their original form for now.
    };
  };

  users.users.${specialArgs.username} = {
    home = "/Users/${specialArgs.username}";
  };
}

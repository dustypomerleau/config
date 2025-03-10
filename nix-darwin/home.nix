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
        #
        # Note: these file paths are relative to $HOME, so references are to ~/Library/..., for example.
        file = {
          ".cargo/config.toml".source = /Users/${specialArgs.username}/.config/cargo/config.toml;
          ".gitconfig".source = /Users/${specialArgs.username}/.config/git/.gitconfig;
          ".gitignore_global".source = /Users/${specialArgs.username}/.config/git/.gitignore_global;
          ".luacheckrc".source = /Users/${specialArgs.username}/.config/.luacheckrc;
          ".psqlrc".source = /Users/${specialArgs.username}/.config/postgres/.psqlrc;
          ".ssh/config".source = /Users/${specialArgs.username}/.config/ssh/config;
          ".zshenv".source = /Users/${specialArgs.username}/.config/zsh/.zshenv;
          "Library/Application Support/Code/User/keybindings.json".source = /Users/${specialArgs.username}/.config/code/keybindings.json;
          "Library/Application Support/Code/User/settings.json".source = /Users/${specialArgs.username}/.config/code/settings.json;
          "Library/Application Support/jj/config.toml".source = /Users/${specialArgs.username}/.config/jj/config.toml;
          "Library/Application Support/org.dystroy.broot/conf.hjson".source = /Users/${specialArgs.username}/.config/broot/conf.hjson;
          "Library/Application Support/org.dystroy.broot/conf.toml".source = /Users/${specialArgs.username}/.config/broot/conf.toml;
          "Library/Application Support/org.dystroy.broot/skins/dark-blue.hjson".source = /Users/${specialArgs.username}/.config/broot/skins/dark-blue.hjson;
          "Library/Application Support/org.dystroy.broot/verbs.hjson".source = /Users/${specialArgs.username}/.config/broot/verbs.hjson;
          "Library/Preferences/glow/glow.yml".source = /Users/${specialArgs.username}/.config/glow/glow.yml;
          "themes.gitconfig".source = /Users/${specialArgs.username}/.config/git/themes.gitconfig;
          # ".zshrc".source = /Users/${specialArgs.username}/.config/zsh/.zshrc;
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

{ config, lib, pkgs, nix-doom-emacs, stylix, username, email, dotfilesDir, theme, wm, browser, editor, spawnEditor, term, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = username;
  home.homeDirectory = "/home/"+username;

  programs.home-manager.enable = true;

  imports = [ ../work/home.nix # Personal is essentially work system + games
              ../../user/app/games/games.nix # Various videogame apps
            ];

  home.stateVersion = "22.11"; # Please read the comment before changing.

  home.packages = with pkgs; [
    # Core
    zsh
    alacritty
    librewolf
    brave
    dmenu
    rofi
    git
    syncthing

    # Media
    gtkcord4
    tuxpaint
  ];

  xdg.enable = true;
  xdg.userDirs = {
    extraConfig = {
      XDG_GAME_DIR = "${config.home.homeDirectory}/Media/Games";
      XDG_GAME_SAVE_DIR = "${config.home.homeDirectory}/Media/Game Saves";
    };
  };

}

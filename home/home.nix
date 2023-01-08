{ config, pkgs, lib, ... }:
let
  username = "cameron";
in {

  imports = [
    ./nvim/nvim.nix
  ];

  home = {
    inherit username;
    homeDirectory = "/home/${username}";
    stateVersion = "23.05";

    packages = with pkgs; [
      neofetch
      slack
      discord
      imagemagick
      ffmpeg
      mpv
      thunderbird
      steam
      xclip
      pass
      rofi-pass
      zathura
      librewolf
    ];
  };

#  gtk.cursorTheme = {
#    package = "phinger-cursors";
#    name = "phinger-cursors-dark";
#  };

  # TODO work out how to move this to everforest file
  xdg.configFile."alacritty/everforest.yaml".source = ./alacritty/everforest.yaml;

  programs = {
    home-manager.enable = true;

    git = import ./git.nix;
    
    bat = import ./bat.nix;

    btop = {
      enable = true;
      settings = {
        # TODO
	    color_theme = "everforest-dark-hard";
      };
    };

    alacritty = import ./alacritty/alacritty.nix;

    zsh = import ./zsh/zsh.nix pkgs;

    starship = import ./zsh/starship.nix lib;
  };
}

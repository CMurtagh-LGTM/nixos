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
      zathura
      librewolf
      pavucontrol
    ];

    pointerCursor = {
        gtk.enable = true;
        x11.enable = true;
        package = pkgs.phinger-cursors;
        name = "phinger-cursors-dark";
    };
  };

  xsession = {
    windowManager.command = "leftwm";
  };

  # TODO work out how to move this
  xdg.configFile."alacritty/everforest.yaml".source = ./alacritty/everforest.yaml;
  xdg.configFile."rofi/nord.rasi".source = ./rofi/nord.rasi;
  xdg.configFile."rofi/nord_icons.rasi".source = ./rofi/nord_icons.rasi;
  xdg.configFile."rofi/powermenu.rasi".source = ./rofi/powermenu.rasi;

  services = {
    dunst = import ./dunst.nix;
    picom = import ./picom.nix;
  };

  programs = {
    home-manager.enable = true;

    git = import ./git.nix;
    
    bat = import ./bat.nix;

    rofi = import ./rofi/rofi.nix;

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

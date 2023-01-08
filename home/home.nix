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
    ];
  };

#  gtk.cursorTheme = {
#    package = "phinger-cursors";
#    name = "phinger-cursors-dark";
#  };

  programs = {
    home-manager.enable = true;

    git = {
      # TODO
      enable = true;
      userName = "CMurtagh-LGTM";
      userEmail = "cameron.murtagh00@gmail.com";
    };

    btop = {
      enable = true;
      settings = {
        # TODO
	    color_theme = "everforest-dark-hard";
      };
    };

    zsh = import ./zsh/zsh.nix pkgs;

    starship = import ./zsh/starship.nix lib;
  };
}

{ config, pkgs, ... }:
let
  username = "cameron";
in {
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
    ];
  };

  programs = {
    home-manager.enable = true;

    git = {
      enable = true;
      userName = "CMurtagh-LGTM";
      userEmail = "cameron.murtagh00@gmail.com";
    };

    zsh = {
      enable = true;
      prezto = {
        enable = true;
      };
    };
  };
}

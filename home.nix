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
	pmodules = [
	  "environment"
	  "terminal"
	  "editor"
	  "history"
	  "directory"
	  "spectrum"
	  "utility"
 	  "completion"
  	  "prompt"
	  "history-substring-search"
	  "autosuggestions"
	];
	prompt.theme = "powerlevel10k";
	ssh.identities = ["github"];
      };
      plugins = [
	{
	  name = "per-directory-history";
	  src = pkgs.fetchFromGitHub {
	    owner = "jimhester";
	    repo = "per-directory-history";
	    rev = "master";
	    sha256 = "sha256-7Z0qaDhgopKt9BDKSqdziw9jsVgiLLafs30wPPbz+oo=";
	  };
	}
      ];
    };
  };
}

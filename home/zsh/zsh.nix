pkgs: {
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
}

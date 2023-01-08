{
    # TODO
    enable = true;
    userName = "CMurtagh-LGTM";
    userEmail = "cameron.murtagh00@gmail.com";
    aliases = {
        graph = "log --graph --decorate --oneline";
    };
    delta = {
        enable = true;
        options = {
            plus-style = "syntax";
            minus-style = "syntax";
            syntax-theme = "base16";
            side-by-side = true;
        };
    };
    ignores = [
        "tags"
        "ccls-cache"
        ".ccls-cache"
    ];
}

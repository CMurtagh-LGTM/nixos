lib: {
    enable = true;
    enableZshIntegration = true;
    settings = {
        add_newline = false;
        format = lib.concatStrings [
            "$username"
            "$hostname"
            "$directory"
            "$git_branch"
            "$git_commit"
            "$git_state"
            "$git_status"
            "$docker_context"
            "$container"
            "$package"
            "$python"
            "$nix_shell"
            "$sudo"
            "$character"
        ];
        right_format = "$jobs$status$cmd_duration";
        directory = {
            truncation_length = 7;
            truncate_to_repo = false;
            truncation_symbol = ".../";
        };
        git_branch = {
            format = "[$symbol$branch(:$remote_branch)]($style) ";
            symbol = "";
        };
        git_commit = {
            tag_disabled = false;
            tag_symbol = "";
        };
        git_status = {
            format = "([$all_status$ahead_behind]($style) )";
            conflicted = "~$count";
            ahead = "⇡$count";
            behind = "⇣$count";
            diverged = "⇡$ahead_count⇣$behind_count";
            untracked = "?$count";
            stashed = "*$count";
            modified = "!$count";
            staged = "+$count";
            renamed = "»$count";
            deleted = "✘$count";
        };
        sudo = {
            disabled = false;
            format = "[s]($style)";
        };
        cmd_duration = {
            format = "[$duration]($style)";
        };
        status = {
            disabled = false;
        };
    };
}

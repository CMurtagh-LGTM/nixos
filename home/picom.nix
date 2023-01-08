{
    enable = true;
    shadow = false;
    fade = false;

    opacityRules = [
        "95:class_g = 'Thunar'"
        "95:class_g = 'Spotify'"
        "95:class_g = 'discord'"
        "95:class_g = 'Slack'"
        "95:class_g = 'Steam'"
        "70:class_i = 'pmenu'"
    ];

    backend = "glx";

    vSync = true;

    settings = {
        blur = {
            method = "dual_kawase";
            background = true;
            strength = 3;
            background-exclude = [
                "window_type = 'dock'"
                "window_type = 'desktop'"
                "class_g = 'activate-linux'"
                "_GTK_FRAME_EXTENTS@:c"
            ];
        };

        mark-wmwin-focused = true;
        mark-ovredir-focused = true;
        detect-rounded-corners = true;
        detect-client-opacity = true;
        refresh-rate = 0;
        use-ewmh-active-win = true;
        detect-transient = true;
        detect-client-leader = true;
        use-damage = true;
    };
}

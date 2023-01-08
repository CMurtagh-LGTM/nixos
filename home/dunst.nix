{
    enable = true;
    settings = {
        global = {
            ### Display ###
            # Display notification on focused monitor.
            follow = "mouse";
            # The geometry of the window:
            width = 300;
            height = 300;
            origin = "top-right";
            offset = "30x20";
            notification_limit = 15;

            # Show how many messages are currently hidden (because of geometry).
            indicate_hidden = "yes";

            # Defines color of the frame around the notification window.
            frame_color = "#88c0d0";

            ### Text ###

            font = "Hack 12";

            # Show age of message if message is older than show_age_threshold
            # seconds.
            # Set to -1 to disable.
            show_age_threshold = 120;

            ### Icons ###

            # Align icons left/right/off
            icon_position = "left";

            ### History ###

            # Should a notification popped up from history be sticky or timeout
            # as if it would normally do.
            sticky_history = "yes";

            ### Misc/Advanced ###

            # dmenu path.
            dmenu = "/usr/bin/rofi -dmenu -p dunst:";
        };
    };
}

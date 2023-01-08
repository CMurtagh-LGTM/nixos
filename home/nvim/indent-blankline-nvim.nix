pkgs: with pkgs.vimPlugins; {
    plugin = indent-blankline-nvim;
    config = ''
lua << EOF
require("indent_blankline").setup {
    buftype_exclude = {"terminal", "nofile"},
    show_current_context = true,
}
EOF
    '';
}

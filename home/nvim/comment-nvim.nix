pkgs: with pkgs.vimPlugins; {
    plugin = comment-nvim;
    config = ''
lua << EOF
-- TODO mappings aren't right
require('Comment').setup{
    ignore = "^$",
    toggler = {
        line = "<leader>cc",
        block = "<leader>cb",
    },
    opleader = {
        line = "<leader>cz",
        block = "<leader>cx",
    },
    mappings = {
        basic = true,
        extra = false,
        extended = false,
    },
}
EOF
    '';
}

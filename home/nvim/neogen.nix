pkgs: with pkgs.vimPlugins; {
    plugin = neogen;
    config = ''
lua << EOF
require('neogen').setup()
require("which-key").register({
    ["<leader>"] = {
        a = {"<cmd>Neogen<cr>", "Generate annotation"}
    },
})
EOF
    '';
}

pkgs: with pkgs.vimPlugins; {
    plugin = which-key-nvim;
    config = ''
set timeoutlen=250
lua << EOF
require("which-key").setup{
    plugins = {
        spelling = {
            enabled = true,
            suggestions = 20,
        },
    },
}
EOF
nnoremap  <cmd>WhichKey<cr>
inoremap  <cmd>WhichKey<cr>
vnoremap  <cmd>WhichKey<cr>
    '';
}

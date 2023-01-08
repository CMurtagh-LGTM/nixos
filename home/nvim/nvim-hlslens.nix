pkgs: with pkgs.vimPlugins; {
    plugin = nvim-hlslens;
    config = ''
nnoremap <silent> n <cmd>execute('normal! ' . v:count1 . 'n')<cr>
            \<cmd>lua require('hlslens').start()<cr>
nnoremap <silent> N <cmd>execute('normal! ' . v:count1 . 'N')<cr>
            \<cmd>lua require('hlslens').start()<cr>
nnoremap * *<cmd>lua require('hlslens').start()<cr>
nnoremap # #<cmd>lua require('hlslens').start()<cr>
nnoremap g* g*<cmd>lua require('hlslens').start()<cr>
nnoremap g# g#<cmd>lua require('hlslens').start()<cr>
lua << EOF
require'which-key'.register {
    ["<leader>"] = {
        h = {":nohlsearch<cr>", "remove search highlight"},
    }
}
EOF
    '';
}

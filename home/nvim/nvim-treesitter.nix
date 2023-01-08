pkgs: with pkgs.vimPlugins; {
    plugin = nvim-treesitter.withPlugins (p: [p.nix p.python p.cpp p.lua p.latex p.r p.vim p.java p.markdown p.rust p.zig]);
    config = ''
lua << EOF
require'nvim-treesitter.configs'.setup {
    highlight = {
        enable = true,
    },
    indent = {
        enable = true,
    },
    autopairs = {
        enable = true,
    },
}
EOF
    '';
}

pkgs: with pkgs.vimPlugins; {
    plugin = nvim-scrollbar;
    config = ''
" Scrollbar TODO come back when more developed
lua << EOF
local configuration = vim.fn['everforest#get_configuration']()
local palette = vim.fn['everforest#get_palette'](configuration.background, configuration.colors_override)
require("scrollbar").setup{
    show = true,
    handle = {
        text = " ",
        color = palette.bg0[1],
        hide_if_all_visible = true, -- Hides handle if all lines are visible
    },
    marks = {
        Search = { text = { "-", "=" }, priority = 0, color = palette.green[1] },
        Error  = { text = { "-", "=" }, priority = 1, color = palette.red[1] },
        Warn   = { text = { "-", "=" }, priority = 2, color = palette.orange[1] },
        Info   = { text = { "-", "=" }, priority = 3, color = palette.yellow[1] },
        Hint   = { text = { "-", "=" }, priority = 4, color = palette.blue[1] },
        Misc   = { text = { "-", "=" }, priority = 5, color = palette.purple[1] },
    },
    handlers = {
        diagnostic = true,
        search = true,
    },
}
EOF
    '';
}

pkgs: with pkgs.vimPlugins; {
    plugin = lualine-nvim;
    config = ''
lua << EOF
require('lualine').setup {
    options = {
        theme = 'everforest',
        component_separators = "",
        section_separators = "",
        globalstatus = true,
    },
    sections = {
        lualine_a = {
            {-- mode
                function()
                    local mode_names = {
                        V = 'VL',
                        [''] = 'VB',
                    }
                    if mode_names[vim.fn.mode()] == nil then
                        return string.upper(vim.fn.mode())
                    else
                        return mode_names[vim.fn.mode()]
                    end
                end,
            },
        },
        lualine_b = {{'branch', }},
        lualine_c = {
            {'filename', path = 1},
            {function() return '%=' end},
            { -- Lsp server name .
                function()
                    local msg = 'No Active Lsp'
                    local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
                    local clients = vim.lsp.get_active_clients()
                    if next(clients) == nil then return msg end
                    for _, client in ipairs(clients) do
                        local filetypes = client.config.filetypes
                        if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
                            return client.name
                        end
                    end
                    return msg
                end,
                icon = ' ',
                color = {gui = 'bold'}
            }
        },
        lualine_x = {
            {'filetype', colored = false}
        },
        lualine_y = {'progress'},
        lualine_z = {'location'}
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {{'filename', file_status = false}},
        lualine_x = {{'filetype', colored = false}},
        lualine_y = {'location'},
        lualine_z = {}
    },
}
EOF
    '';
}

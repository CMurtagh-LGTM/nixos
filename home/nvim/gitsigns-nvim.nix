pkgs: with pkgs.vimPlugins; {
    plugin = gitsigns-nvim;
    config = ''
lua << EOF
require('gitsigns').setup{
    signcolumn = false,
    numhl = true,
    on_attach = function(bufnr)
        local function map(mode, lhs, rhs, opts)
            opts = vim.tbl_extend('force', {noremap = true, silent = true}, opts or {})
            vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, opts)
        end

        -- Navigation
        map('n', '<leader>]', '<cmd>Gitsigns next_hunk<CR>')
        map('n', '<leader>[', '<cmd>Gitsigns prev_hunk<CR>')

        -- Actions
        map('n', '<leader>gs', '<cmd>Gitsigns stage_hunk<CR>')
        map('v', '<leader>gs', '<cmd>Gitsigns stage_hunk<CR>')
        map('n', '<leader>gr', '<cmd>Gitsigns reset_hunk<CR>')
        map('v', '<leader>gr', '<cmd>Gitsigns reset_hunk<CR>')
        map('n', '<leader>gS', '<cmd>Gitsigns stage_buffer<CR>')
        map('n', '<leader>gu', '<cmd>Gitsigns undo_stage_hunk<CR>')
        map('n', '<leader>gR', '<cmd>Gitsigns reset_buffer<CR>')
        map('n', '<leader>gp', '<cmd>Gitsigns preview_hunk<CR>')
        map('n', '<leader>gd', '<cmd>Gitsigns diffthis<CR>')
        map('n', '<leader>gD', '<cmd>lua require"gitsigns".diffthis("~")<CR>')
        map('n', '<leader>gt', '<cmd>Gitsigns toggle_deleted<CR>')
    end
}
EOF
    '';
}

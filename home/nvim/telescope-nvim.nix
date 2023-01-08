pkgs: with pkgs.vimPlugins; {
    plugin = telescope-nvim;
    config = ''
lua << EOF
require"which-key".register{
    ["<leader>"] = {
        f = {
	    name = "find",
	    ["<space>"] = {"<cmd>Telescope git_files<cr>", "git files"},
-- nnoremap <leader>ff <cmd>Telescope file_browser<cr>
-- nnoremap <leader>fg <cmd>Telescope live_grep<cr>
-- nnoremap <leader>fo <cmd>Telescope oldfiles<cr>

-- nnoremap <leader>fB <cmd>Telescope bibtex cite<cr>
-- nnoremap <leader>fh <cmd>Telescope help_tags<cr>
-- nnoremap <leader>fm <cmd>lua require'telescope.builtin'.man_pages({sections={"2", "3", "3p", "4", "7"}})<cr>
-- nnoremap <leader>fq <cmd>Telescope quickfix<cr>

-- nnoremap <leader>fT <cmd>Telescope tags<cr>
-- nnoremap <leader>ft <cmd>Telescope treesitter<cr>

-- nnoremap <leader>f<leader> <cmd>Telescope builtin<cr>
-- nnoremap <leader>fp <cmd>Telescope planets<cr>

-- nnoremap <leader>g<leader> <cmd>Telescope git_status<cr>
-- nnoremap <leader>Gi <cmd>Telescope gh issues<cr>
-- nnoremap <leader>Gp <cmd>Telescope gh pull_request<cr>
-- nnoremap <leader>Gg <cmd>Telescope gh gist<cr>
-- nnoremap <leader>Gr <cmd>Telescope gh run<cr>
        }
    }
}

-- nnoremap <leader><leader>r <cmd>Telescope lsp_references<cr>
-- nnoremap <leader><leader>i <cmd>Telescope lsp_implementations<cr>
-- nnoremap <leader><leader>d <cmd>Telescope lsp_definitions<cr>
-- nnoremap <leader><leader>c <cmd>Telescope lsp_code_actions<cr>
-- nnoremap <leader><leader>s <cmd>Telescope lsp_document_symbols<cr>
-- nnoremap <leader><leader>w <cmd>Telescope lsp_workspace_symbols<cr>
-- nnoremap <leader><leader>p <cmd>Telescope diagnostics<cr>

require('telescope').setup{
  defaults = {
    vimgrep_arguments = {
      'rg',
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case'
    },
    prompt_prefix = "  ",
    initial_mode = "insert",
    selection_strategy = "reset",
    use_less = false,
    set_env = { ['COLORTERM'] = 'truecolor' }, -- default = nil, 
  }
}
require('telescope').load_extension('fzy_native')
require('telescope').load_extension('bibtex')
require('telescope').load_extension('file_browser')
require('telescope').load_extension('gh')
EOF
    '';
}

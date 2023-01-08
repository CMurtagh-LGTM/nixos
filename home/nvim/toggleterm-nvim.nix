pkgs: with pkgs.vimPlugins; {
    plugin = toggleterm-nvim;
    config = ''
lua << EOF
require("toggleterm").setup{
  -- size can be a number or function which is passed the current terminal
  open_mapping = [[<leader>t]],
  insert_mappings = false,
  hide_numbers = true, -- hide the number column in toggleterm buffers
  start_in_insert = true,
  shade_terminals = false,
  close_on_exit = true, -- close the terminal window when the process exits
  shell = vim.o.shell, -- change the default shell
}

local Terminal  = require('toggleterm.terminal').Terminal

function _G.set_terminal_keymaps()
  local opts = {noremap = true}
  vim.api.nvim_buf_set_keymap(0, 't', '<esc>', [[<C-\><C-n>]], opts)
end
vim.cmd('autocmd! TermOpen term://*toggleterm#* lua set_terminal_keymaps()')
EOF

augroup toggleterm
    au!
    au TermOpen * setlocal nospell
augroup end
    '';
}

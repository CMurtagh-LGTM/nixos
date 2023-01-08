{ config, pkgs, ...}:

{
  # TODO copy all old settings
  programs.neovim = {
    enable = true;
    extraConfig = ''
" Theme
set termguicolors
set background=dark
let g:everforest_background='medium'
colorscheme everforest

" Line numbers
set number
" Spelling check
set spelllang=en_gb
set spell
" tab size
set tabstop=4
set shiftwidth=4
set expandtab
" Hide the mode text
set noshowmode
" Use system clipboard
set clipboard=unnamedplus
" Allow unsaved hidden buffers
set hidden
" Allow mouse clicks
set mouse=a
" Use smartcase in searching
set smartcase
" Make the cursor stay in the middle quarter
set scrolloff=12
" Always show sign column
set signcolumn=yes
" Space ftw
let mapleader = " "
let maplocalleader = " "
" No folds
set foldlevelstart=99

" Highlight yank
augroup highlight_yank
autocmd!
au TextYankPost * lua vim.highlight.on_yank {higroup="IncSearch", timeout=500, on_visual=true}
augroup END
    '';
    plugins = with pkgs.vimPlugins; [
      # TODO lsp
      (import ./nvim-treesitter.nix pkgs)
      (import ./lualine-nvim.nix pkgs)
      nvim-web-devicons
      (import ./bufferline-nvim.nix pkgs)
      (import ./comment-nvim.nix pkgs)
      # (import ./neogen.nix pkgs) # TODO not in repo?
      # TODO tags
      plenary-nvim
      (import ./which-key-nvim.nix pkgs)
      # (import ./telescope-nvim.nix pkgs) # TODO work out how to do extensions
      (import ./toggleterm-nvim.nix pkgs)
      (import ./gitsigns-nvim.nix pkgs)
      (import ./wilder-nvim.nix pkgs)
      (import ./indent-blankline-nvim.nix pkgs)
      (import ./nvim-autopairs.nix pkgs)
      (import ./nvim-hlslens.nix pkgs)
      (import ./nvim-scrollbar.nix pkgs)
      (import ./alpha-nvim.nix pkgs)
      nvim_context_vt
      {
        plugin = nvim-colorizer-lua;
        config = "lua require'colorizer'.setup()";
      }
      #{
      #  plugin = dim-lua; # Not in Repo
      #  config = "lua require'dim'.setup({})";
      #}
      {
        plugin = vimtex;
        config = "let g:vimtex_view_general_viewer = 'zathura'";
      }
      #sxhkd-vim # Not in repo
      yuck-vim
      everforest
    ];
  };
}

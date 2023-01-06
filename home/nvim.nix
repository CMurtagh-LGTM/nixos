{ config, pkgs, ...}:

{
  # TODO copy all old settings
  programs.neovim = {
    enable = true;
    plugins = with pkgs.vimPlugins; [
      {
        plugin = nvim-treesitter.withPlugins (p: [p.nix]);
      }
      {
        plugin = bufferline-nvim;
      }
      everforest
    ];
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
    '';
  };
}

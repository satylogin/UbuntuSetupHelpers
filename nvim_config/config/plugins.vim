call plug#begin('~/.vim/plugged')

Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/lsp_extensions.nvim'
Plug 'nvim-lua/completion-nvim'

Plug 'vim-airline/vim-airline'
Plug 'rust-lang/rust.vim'
Plug 'scrooloose/syntastic'
Plug 'cespare/vim-toml'
Plug 'npxbr/glow.nvim', {'do': ':GlowInstall', 'branch': 'main'}
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'akinsho/nvim-toggleterm.lua'
Plug 'mhinz/vim-startify'

Plug 'KeitaNakamura/neodark.vim'
Plug 'vim-airline/vim-airline-themes'

Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-media-files.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim'

Plug 'kyazdani42/nvim-web-devicons'
Plug 'kyazdani42/nvim-tree.lua'

Plug 'kabouzeid/nvim-lspinstall'

call plug#end()


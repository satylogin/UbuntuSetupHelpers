call plug#begin('~/.vim/plugged')

Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/lsp_extensions.nvim'
Plug 'nvim-lua/completion-nvim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'vim-scripts/netrw.vim'
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'

Plug 'vim-airline/vim-airline'
Plug 'rust-lang/rust.vim'
Plug 'scrooloose/syntastic'
Plug 'cespare/vim-toml'
Plug 'npxbr/glow.nvim', {'do': ':GlowInstall', 'branch': 'main'}
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'akinsho/nvim-toggleterm.lua'
Plug 'mhinz/vim-startify'
Plug 'joshdick/onedark.vim'

Plug 'kabouzeid/nvim-lspinstall'

call plug#end()


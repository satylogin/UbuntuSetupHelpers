call plug#begin('~/.vim/plugged')

Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/lsp_extensions.nvim'
Plug 'nvim-lua/completion-nvim'
Plug 'ctrlpvim/ctrlp.vim'
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
Plug 'KeitaNakamura/neodark.vim'

Plug 'kabouzeid/nvim-lspinstall'

call plug#end()

syntax enable
colorscheme neodark
filetype plugin indent on

" Configure LSP
" https://github.com/neovim/nvim-lspconfig#rust_analyzer
lua <<EOF
local nvim_lsp = require'lspconfig'

local on_attach = function(client, bufnr)
    vim.lsp.handlers["textDocument/hover"] =  vim.lsp.with(vim.lsp.handlers.hover, {border = border})
    vim.lsp.handlers["textDocument/signatureHelp"] =  vim.lsp.with(vim.lsp.handlers.signature_help, {border = border})
    require'completion'.on_attach(client)
end

nvim_lsp.rust_analyzer.setup({ on_attach=on_attach })
nvim_lsp.pyright.setup({ on_attach=on_attach })

-- Enable diagnostics
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    virtual_text = true,
    signs = true,
    update_in_insert = true,
  }
)

vim.cmd("command! -nargs=? -complete=file Glow :lua require('glow').glow('<f-args>')")
require("toggleterm").setup{}

require'lspinstall'.setup()
local servers = require'lspinstall'.installed_servers()
for _, server in pairs(servers) do
  require'lspconfig'[server].setup{ on_attach=on_attach }
end
EOF

autocmd BufEnter * lua require'completion'.on_attach()

set number
set relativenumber
set mouse=a
set autoindent
set tabstop=4
set shiftwidth=4
set expandtab
set textwidth=100
set cc=+1

let g:rustfmt_autosave = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'

" Syntastic setting
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_loc_list_height = 2

" Set completeopt to have a better completion experience
" :help completeopt
" menuone: popup even when there's only one match
" noinsert: Do not insert text until a selection is made
" noselect: Do not select, force user to select one from the menu
set completeopt=menuone,noinsert,noselect

" Avoid showing extra messages when using completion
set shortmess+=c

" Set updatetime for CursorHold
" 1000ms of no cursor movement to trigger CursorHold
set updatetime=1000
" Show diagnostic popup on cursor hold
autocmd CursorHold * lua vim.lsp.diagnostic.show_line_diagnostics()

" have a fixed column for the diagnostics to appear in
" this removes the jitter when warnings/errors flow in
set signcolumn=yes

" Enable type inlay hints
autocmd CursorMoved,InsertLeave,BufEnter,BufWinEnter,TabEnter,BufWritePost *
\ lua require'lsp_extensions'.inlay_hints{ prefix = '', highlight = "Comment", enabled = {"TypeHint", "ChainingHint", "ParameterHint"} }

" Find files using Telescope command-line sugar. 
let mapleader = " " 

" Code navigation shortcuts
nnoremap <silent> <c-]> <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gD    <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> 1gD   <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>
nnoremap <silent> gW    <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
nnoremap <silent> gd    <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> ga    <cmd>lua vim.lsp.buf.code_action()<CR>
nnoremap <silent> g[ <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
nnoremap <silent> g] <cmd>lua vim.lsp.diagnostic.goto_next()<CR>

" To launch terminal inside neovim
nnoremap <silent><c-t> <Cmd>exe v:count1 . "ToggleTerm"<CR>

nnoremap <leader>ff :CtrlP 

" Rust specific mapping
noremap <leader>rt <cmd>RustTest<cr>
noremap <leader>rat <cmd>RustTest!<cr>

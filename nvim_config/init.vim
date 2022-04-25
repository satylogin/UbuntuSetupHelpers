set nocompatible
set backspace=indent,eol,start
set hidden
set noswapfile
let g:mapleader = " "

call plug#begin('~/.vim/nvim-plugged')
    Plug 'tpope/vim-sensible'
    Plug 'itchyny/lightline.vim'
    Plug 'sainnhe/gruvbox-material'
    Plug 'ctrlpvim/ctrlp.vim'

    Plug 'neovim/nvim-lspconfig'
    Plug 'hrsh7th/nvim-cmp'
    Plug 'hrsh7th/cmp-nvim-lsp'

    Plug 'cespare/vim-toml'
    Plug 'rust-lang/rust.vim'
call plug#end()

lua << EOF
local nvim_lsp = require('lspconfig')
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  local opts = { noremap=true, silent=true }
  buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('i', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)

  buf_set_keymap('n', '<leader>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
  buf_set_keymap('n', '[g', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']g', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
end

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
        virtual_text = false,
        underline = false,
    }
)

local servers = { 'rust_analyzer'}
for _, lsp in pairs(servers) do
  require('lspconfig')[lsp].setup {
    on_attach = on_attach,
  }
end

require('cmp').setup {
  sources = {
    { name = 'nvim_lsp' },
  },
}
vim.o.completeopt = 'menuone,noselect,noinsert'
EOF

set termguicolors
syntax enable
set bg=dark
colorscheme gruvbox-material
filetype plugin indent on
set mouse=a
set number
set relativenumber
set autoindent
set tabstop=4
set shiftwidth=4
set expandtab
set textwidth=100
set cc=+1
set updatetime=1000
set signcolumn=yes:2
set showtabline=2
set cursorline
set laststatus=3

" Rust
let g:rustfmt_autosave = 1

" Java
let java_ignore_javadoc = 1

" CtrlP
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.git|\.hg|\.svn|target)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ }

nnoremap <leader>fb :CtrlPBuffer<cr>
nnoremap <leader>ff :CtrlP .<cr>
nnoremap <leader>fq :CtrlP 
nnoremap <leader>nh :nohlsearch<cr>
nnoremap <leader>dd :lua vim.diagnostic.setloclist()<cr>
vnoremap <leader>cp "+y

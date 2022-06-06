set nocompatible

syntax off
filetype plugin indent off

call plug#begin('~/.vim/vim-plugged')
    Plug 'vim-airline/vim-airline'
    Plug 'tpope/vim-sensible'
    Plug 'morhetz/gruvbox'
    Plug 'cespare/vim-toml'
    Plug 'rust-lang/rust.vim'

    Plug 'prabirshrestha/vim-lsp'
    Plug 'prabirshrestha/asyncomplete.vim'
    Plug 'prabirshrestha/asyncomplete-lsp.vim'

    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
call plug#end()

let g:mapleader = " "

function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=yes
    if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
    nnoremap <buffer> gd :LspDefinition<CR>
    nnoremap <buffer> gr :LspReferences<CR>
    nnoremap <buffer> gi :LspImplementation<CR>
    nnoremap <buffer> <leader>rn :LspRename<CR>
    nnoremap <buffer> [g :LspPrevDiagnostic<CR>
    nnoremap <buffer> ]g :LspNextDiagnostic<CR>
    nnoremap <buffer> K :LspHover<CR>

    let g:lsp_format_sync_timeout = 1000
    autocmd! BufWritePre *.rs,*.go call execute('LspDocumentFormatSync')

    " refer to doc to add more commands
endfunction

augroup lsp_install
    au!
    " call s:on_lsp_buffer_enabled only for languages that has the server registered.
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

let g:asyncomplete_auto_completeopt = 0
let g:lsp_document_code_action_signs_enabled = 1
let g:lsp_diagnostics_echo_cursor = 1
let g:lsp_diagnostics_float_cursor = 0
let g:lsp_diagnostics_highlights_enabled = 0

set completeopt=menuone,noinsert,noselect,preview

if executable('rust-analyzer')
  au User lsp_setup call lsp#register_server({
        \   'name': 'Rust Language Server',
        \   'cmd': {server_info->['rust-analyzer']},
        \   'whitelist': ['rust'],
        \   'initialization_options': {'checkOnSave': {'allTargets': v:false, }, },
        \ })
endif

let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

let g:gruvbox_contrast_dark='soft'

set bg=dark
set termguicolors
colorscheme gruvbox
set backspace=indent,eol,start
set hidden
set noswapfile
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
set signcolumn=yes
set cursorline
set showtabline=2

let g:rustfmt_autosave = 1

" persist undo history
if has('persistent_undo')
    let target_path = expand('~/.config/vim-persisted-undo/')
    if !isdirectory(target_path)
        call system('mkdir -p ' . target_path)
    endif
    let &undodir = target_path
    set undofile
endif

function! TogglePaste()
    if(&paste == 0)
        set paste
    else
        set nopaste
    endif
endfunction

nnoremap <leader>tp :call TogglePaste()<cr>
nnoremap <leader>fb :Buffers<CR>
nnoremap <leader>ff :Files<CR>
nnoremap <leader>rt :RustTest<CR>
nnoremap <leader>dd :LspDocumentDiagnostics<CR>

inoremap <c-u> <esc>viwU
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <leader>" viw<esc>a"<esc>bi"<esc>lel

syntax on
filetype plugin indent on

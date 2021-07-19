execute pathogen#infect()

let g:rustfmt_autosave = 1
let g:airline#extensions#tabline#enabled = 1
let NERDTreeMapOpenInTab='nt'
syntax enable
filetype plugin indent on
set ts=4
set number
set expandtab
set splitbelow
set autoread

set mouse=a
set ttymouse=sgr
set ballooneval

let g:racer_cmd = 1

augroup Racer
    autocmd!
    autocmd FileType rust nmap <buffer> gd         <Plug>(rust-def)
    autocmd FileType rust nmap <buffer> gs         <Plug>(rust-def-split)
    autocmd FileType rust nmap <buffer> gx         <Plug>(rust-def-vertical)
    autocmd FileType rust nmap <buffer> gt         <Plug>(rust-def-tab)
    autocmd FileType rust nmap <buffer> <leader>gd <Plug>(rust-doc)
    autocmd FileType rust nmap <buffer> <leader>gD <Plug>(rust-doc-tab)
augroup END

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_loc_list_height = 2
let g:syntastic_enable_balloons = 1

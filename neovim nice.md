### Move blocks of code around

1. https://github.com/matze/vim-move Similar keybinding:
    ```vim
    " Shift + J/K moves selected lines down/up in visual mode
    " https://www.reddit.com/r/neovim/comments/rfrgq5/comment/hog28q3/?utm_source=share&utm_medium=web2x&context=3
    vnoremap J :m '>+1<CR>gv=gv
    vnoremap K :m '<-2<CR>gv=gv
    ```
1. https://github.com/hoschi/yode-nvim Allows to pop up a section of code from a buffer, and keep it in view.

" Treat .t files as Perl code.
syntax on
filetype on
au BufNewFile,BufRead *.t set filetype=perl

" Disable automatic visual mode with the mouse.
set mouse-=a

" Restore regular pasting supported by the terminal.
set paste

" Hard tabs, 2 space indent.
set noexpandtab
set shiftwidth=2
set tabstop=2

" Show cursor position.
set ruler

" Add status bar.
set laststatus=2
set statusline=%<%f\ %h%m%r%a%=%y\ 0x%B\ %l,%c%V\ %P
hi StatusLine ctermfg=Gray ctermbg=Black

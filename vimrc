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
set statusline=%<%f\ %h%m%r%a%=%y\ [%{&ff}]\ 0x%B\ %l,%c%V\ [%p%%]\ %P
hi StatusLine ctermfg=Gray ctermbg=Black

" Jump to matches as you type the search.
set incsearch

" Increase/decrease indentation with >/< in visual mode.
vnoremap < <gv
vnoremap > >gv

" Highlight search matches.
set hlsearch

" Perl: align '=>' in hashes (requires Align.vim).
map <buffer> <space>l  :Align<space>=><CR>

" Configure what vim will remember.
"  '10  :  marks will be remembered for up to 10 previously edited files
"  "100 :  will save up to 100 lines for each register
"  :20  :  up to 20 lines of command-line history will be remembered
"  %    :  saves and restores the buffer list
"  n... :  where to save the viminfo files
set viminfo='10,\"100,:20,%,n~/.viminfo

" When editing a file, always jump to the last known cursor position.
function! ResCur()
	if line("'\"") <= line("$")
		normal! g`"
		return 1
	endif
endfunction

augroup resCur
	autocmd!
	autocmd BufWinEnter * call ResCur()
augroup END

" Maintain history between sessions.
" (requires vim 7.3)
try
	set undofile                " Save history.
	set undodir=$HOME/.vim/undo " Directory to save history in.
	set undolevels=1000         " Undo levels to maintain.
	set undoreload=10000        " Max lines to save.
catch
endtry

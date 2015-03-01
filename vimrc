" Load Pathogen to manage vim plugins in the bundle/ directory.
" https://github.com/tpope/vim-pathogen
runtime bundle/pathogen/autoload/pathogen.vim
call pathogen#infect()
call pathogen#helptags()

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
set statusline=%<%f\ %h%m%r%a%=%{\"[\".(&fenc==\"\"?&enc:&fenc).((exists(\"+bomb\")\ &&\ &bomb)?\",B\":\"\").\"]\"}\ %y\ [%{&ff}]\ 0x%B\ %l,%c%V\ [%p%%]\ %P
hi StatusLine ctermfg=Gray ctermbg=Black

" Display list in status bar when using tab autocompletion.
set wildmenu

" I like a white background, so adjust colors accordingly.
set background=light

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

" Add git diff information in the left gutter.
let g:gitgutter_eager = 0
highlight GitGutterAdd ctermbg=grey ctermfg=black
highlight GitGutterChange ctermbg=grey ctermfg=black
highlight GitGutterDelete ctermbg=grey ctermfg=black
highlight GitGutterChangeDelete ctermbg=grey ctermfg=black

" Highlight trailing whitespace.
" See http://vim.wikia.com/wiki/Highlight_unwanted_spaces
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

" Add the file name to the terminal windows' title.
set title
set titleold=""
set titlestring="vim: %F"

" :W allows saving read-only files as root.
command W w !sudo tee % >/dev/null

" Yank/delete/paste from a named register, to prevent the pasted-over content
" from taking the place of the pasted content.
vnoremap p "0p
vnoremap P "0P
vnoremap y "0y
vnoremap d "0d

" Allow silent local vimrc overrides for safe projects.
let g:localvimrc_whitelist='/home/guillaume/trunk/.*'

" "Commentary" plugin - add support for new file types.
autocmd FileType perl set commentstring=#\ %s

" Associate .md with markdown.
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

" Apache configuration files.
au BufRead,BufNewFile /etc/apache2/**.conf set filetype=apache

augroup filetypedetect

	" Treat .t files as Perl code.
	autocmd BufNewFile,BufRead *.t set filetype=perl

	" Associate .md with markdown.
	autocmd BufNewFile,BufRead *.md set filetype=markdown

	" Apache configuration files.
	autocmd BufNewFile,BufRead /etc/apache2/**.conf set filetype=apache

	" Mojolicious templates.
	autocmd BufNewFile,BufRead *.html.ep set filetype=html

augroup END

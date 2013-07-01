Dot Files
=========

Installation
------------

 1. Start by cloning the repository in ```~/dot-files```:

	```
	git clone https://github.com/guillaumeaubert/dot-files.git dot-files
	```

 2. Then symlink the files you are interested in (see below).

List of files
-------------

Here is the list of the various dot files I use:

 * **.vimrc:** user configuration for Vim.

	```
	cd ~
	mv .vimrc .vimrc.original
	ln -s  dot-files/vimrc .vimrc
	```

 * **.bash_profile:** bash configuration.

	```
	cd ~
	mv .bash_profile .bash_profile.original
	ln -s  dot-files/bash_profile .bash_profile
	```

 * **.gitconfig:** global configuration for Git.

	```
	cd ~
	mv .gitconfig .gitconfig.original
	ln -s  dot-files/gitconfig .gitconfig
	```


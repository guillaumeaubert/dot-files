Dot Files
=========

[![Build Status](https://travis-ci.org/guillaumeaubert/dot-files.svg)](https://travis-ci.org/guillaumeaubert/dot-files)


Installation
------------

 1. Start by cloning the repository in ```~/dot-files```:

	```
	git clone https://github.com/guillaumeaubert/dot-files.git dot-files
	```

 2. Then symlink the files you are interested in (see below).

Alternatively, you can install **all** the symlinks at once using`install.sh`.


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

 * **.hushlogin:** disable the global message of the day when you log in.

	```
	cd ~
	mv .hushlogin .hushlogin.original
	ln -s  dot-files/hushlogin .hushlogin
	```

 * **.psqlrc:** psql configuration.

	```
	cd ~
	mv .psqlrc .psqlrc.original
	ln -s dot-files/psqlrc .psqlrc
	```

 * **.dmrc:** per-user language configuration/support.

	```
	cd ~
	mv .dmrc .dmrc.original
	ln -s dot-files/dmrc .dmrc
	```

 * **.screenrc:** `screen` configuration.

	```
	cd ~
	mv .screenrc .screenrc.original
	ln -s dot-files/screenrc .screenrc
	```

 * **.inputrc:** customize programs that use Readline.

	```
	cd ~
	mv .inputrc .inputrc.original
	ln -s dot-files/inputrc .inputrc
	```

 * **.curlrc:** customize defaults for curl.

	```
	cd ~
	mv .curlrc .curlrc.original
	ln -s dot-files/curlrc .curlrc
	```

 * **.wgetrc:** customize defaults for wget.

	```
	cd ~
	mv .wgetrc .wgetrc.original
	ln -s dot-files/wgetrc .wgetrc
	```

 * **.editorconfig:** defaults for editors that support an editorconfig plugin.

	```
	cd ~
	mv .editorconfig .editorconfig.original
	ln -s dot-files/editorconfig .editorconfig
	```

 * **.githooksrc:** defaults for [App::GitHooks](https://metacpan.org/release/App-GitHooks).

	```
	cd ~
	mv .githooksrc .githooksrc.original
	ln -s dot-files/githooksrc .githooksrc
	```


Copyright
---------

Copyright (C) 2013-2016 Guillaume Aubert


License
-------

This software is released under the MIT license. See the LICENSE file for
details.

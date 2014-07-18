#!/usr/bin/env bash

# List of files which are part of the repository but should not be symlinked.
IGNORED_FILES='
	.git
	LICENSE
	README.md
	install.sh
	tools
'

# Create a backup directory for the files we're going to replace.
[ ! -d $HOME/.original ] && mkdir $HOME/.original

# Create symlinks for all the files that exist in the repository.
for file in $(ls $HOME/dot-files/); do
	# Skip ignored files.
	[[ $IGNORED_FILES =~ $file ]] && continue

	# Skip .selected_editor unless the system is Ubuntu.
	[[ -e /etc/lsb-release && $file -eq "selected_editor" ]] && continue

	# Remove the destination file if it is a symlink, otherwise archive it.
	if [ -e $HOME/.$file ]; then
		if [ -L $HOME/.$file ]; then
			rm $HOME/.$file
		else
			mv $HOME/.$file $HOME/.original/.$file
		fi
	fi

	# Symlink our file.
	ln -sf $HOME/dot-files/$file $HOME/.$file
done

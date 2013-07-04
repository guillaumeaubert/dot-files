#!/usr/bin/env bash

for file in $(ls $HOME/dot-files/); do
	if [ ! -e "$HOME/.$file" ]; then
		ln -sf $HOME/dot-files/$file $HOME/.$file
	fi
done

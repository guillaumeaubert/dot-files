#!/bin/bash

# Tweak the behavior of less:
#     - support colors (-R);
#     - set tabs to 2 spaces (-x2);
export LESS='-R -x2'

# Set the correct time zone.
if [ $(whoami) != 'root' ]; then
	export TZ="/usr/share/zoneinfo/America/Los_Angeles"
fi

# Use utf8.
export LANG=en_US.UTF-8

# Filter out noise from the command history.
export HISTIGNORE="&:ls:exit:^[ \t]*"

# Increase how much the command history should store.
export HISTSIZE=500000
export HISTFILESIZE=5000000

# Don't use cowsay for ansible, to keep the logs shorter.
export ANSIBLE_NOCOWS=1

# Don't clear the screen after quitting a man page.
export MANPAGER='less -X';

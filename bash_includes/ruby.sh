#!/bin/bash

#Load RVM into a shell session as a function (if RVM exists).
if [ -s ~/.rvm/scripts/rvm ]; then
	source ~/.rvm/scripts/rvm
fi

# Always display cop names when issues are detected by Rubocop.
alias rubocop='rubocop --display-cop-names'

# Ruby-on-Rails shortcuts.
alias migrate='rake db:migrate'

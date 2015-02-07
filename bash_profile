# include .bashrc if it exists
if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi

# set PATH so it includes user's private bin if it exists
if [ -d ~/bin ] ; then
    PATH=~/bin:"${PATH}"
fi

# Load includes.
source ~/dot-files/bash_includes/shopt.sh
source ~/dot-files/bash_includes/defaults.sh
source ~/dot-files/bash_includes/aliases.sh
source ~/dot-files/bash_includes/functions.sh
source ~/dot-files/bash_includes/git-completion.sh
source ~/dot-files/bash_includes/prompt.sh
source ~/dot-files/bash_includes/extra.sh
source ~/dot-files/bash_includes/motd.sh

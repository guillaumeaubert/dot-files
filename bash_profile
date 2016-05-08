# include .bashrc if it exists
if [ -f ~/.bashrc ]; then
	source ~/.bashrc
fi

# set PATH so it includes user's private bin if it exists
if [ -d ~/bin ] ; then
	PATH=~/bin:"${PATH}"
fi

# Define a horizontal line.
HLINE=$(printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | sed -e 's/ /─/g')

# Do a git pull to bring in the latest updates before sourcing the includes.
cd ~/dot-files/
dotfiles_update=$(git pull --quiet --rebase 2>&1)
if [ "$dotfiles_update" != "Current branch master is up to date." ] && [ "$dotfiles_update" != "" ]; then
	echo "$HLINE";
	echo $dotfiles_update;
fi
git submodule init >/dev/null
git submodule update >/dev/null
cd ~

# Load includes.
source ~/dot-files/bash_includes/shopt.sh
source ~/dot-files/bash_includes/defaults.sh
source ~/dot-files/bash_includes/aliases.sh
source ~/dot-files/bash_includes/cpan_author.sh
source ~/dot-files/bash_includes/functions.sh
source ~/dot-files/bash_includes/git-completion.sh
source ~/dot-files/bash_includes/golang.sh
source ~/dot-files/bash_includes/prompt.sh
source ~/dot-files/bash_includes/ruby.sh
source ~/dot-files/bash_includes/extra.sh
source ~/dot-files/bash_includes/motd.sh

# Load proprietary bash instructions.
if [ -f ~/.bash_proprietary ]; then
	source ~/.bash_proprietary
fi

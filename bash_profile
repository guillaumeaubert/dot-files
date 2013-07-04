# include .bashrc if it exists
if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi

# set PATH so it includes user's private bin if it exists
if [ -d ~/bin ] ; then
    PATH=~/bin:"${PATH}"
fi

# Enable Perlbrew.
source ~/perl5/perlbrew/etc/bashrc

# Alias to rebuild my CPAN distributions.
alias distb="perl Build.PL && ./Build && ./Build disttest && ./Build distclean"

# Git auto-complete.
if [ -f ~/dot-files/git-completion.bash ]; then
  . ~/dot-files/bash_includes/git-completion.sh
fi

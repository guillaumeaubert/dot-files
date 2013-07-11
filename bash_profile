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

# Git author statistics.
alias gastats='git ls-files -z | xargs -0n1 git blame -w | perl -n -e '"'"'/^.*?\((.*?)\s+[\d]{4}/; print ">$1<\n"'"'"' | sort -f | uniq -c | sort -n'

# Add lib/ to 'prove' and make it recursive by default.
alias prove='prove -I lib -r'

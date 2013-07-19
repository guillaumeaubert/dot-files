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

# Add an easy way to test Perl files.
alias t='perl -I lib -T'

# Support colors in 'less' and set tabs to 2 spaces.
export LESS='-R -x2'

# Set the correct time zone.
export TZ="/usr/share/zoneinfo/America/Los_Angeles"

# Alias vim, since I use it all the time.
alias v='vim'

# Message of the day.
perl -le 'print "-" x `tput cols`, "\n", `uptime`, "-" x `tput cols`';

# Load in the git branch prompt script.
source ~/dot-files/git/prompt.sh

# include .bashrc if it exists
if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi

# set PATH so it includes user's private bin if it exists
if [ -d ~/bin ] ; then
    PATH=~/bin:"${PATH}"
fi

# Enable Perlbrew if it is installed.
type perlbrew >/dev/null 2>&1 && {
	source ~/perl5/perlbrew/etc/bashrc
}

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

# Tweak the behavior of less:
#     - support colors (-R);
#     - set tabs to 2 spaces (-x2);
export LESS='-R -x2'

# Set the correct time zone.
export TZ="/usr/share/zoneinfo/America/Los_Angeles"

# Alias vim, since I use it all the time.
alias v='vim'
alias sv="sudo -E vim"

# Message of the day.
perl -le 'print "-" x `tput cols`, "\n", `uptime`, "-" x `tput cols`';

# Load in the git branch prompt script.
source ~/dot-files/git/prompt.sh

# Change the command line prompt to display git info.
export PS1='[\u@\h \W\[\e[32m\]$(__git_ps1 " (%s)")\[\e[m\]]\$ '
export GIT_PS1_SHOWDIRTYSTATE=1     # * for unstaged changes, + for staged changes.
export GIT_PS1_SHOWUNTRACKEDFILES=1 # % for untracked files.

# Display the current directory.
alias p='pwd'

# Use utf8.
export LANG=en_US.UTF-8

# Alias sudo, since I use it often.
alias s="sudo -E"

# Set up line counter.
alias cloc="perl $HOME/dot-files/tools/cloc-1.60.pl --read-lang-def=$HOME/dot-files/tools/cloc_definitions.txt"

# Alias to inspect memory use.
alias ps_mem="sudo python $HOME/dot-files/tools/ps_mem/ps_mem.py"

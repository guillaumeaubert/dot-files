# include .bashrc if it exists
if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi

# set PATH so it includes user's private bin if it exists
if [ -d ~/bin ] ; then
    PATH=~/bin:"${PATH}"
fi

# Enable Perlbrew if it is installed.
if [ -d perl5/perlbrew/ ]; then
	source ~/perl5/perlbrew/etc/bashrc
fi

# Enable cpanm if it is installed.
if [ -e ~/perl5/bin/cpanm ]; then
	~/perl5/bin/cpanm --local-lib=~/perl5 local::lib
	eval $(perl -I ~/perl5/lib/perl5/ -Mlocal::lib)
fi

# Alias to rebuild my CPAN distributions.
alias distb="perl Build.PL && ./Build && ./Build disttest && ./Build distclean"

# Alias to upload my CPAN distributions to PAUSE.
alias distupload='cpan-upload --user AUBERTG --verbose'

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
if [ $(whoami) != 'root' ]; then
	export TZ="/usr/share/zoneinfo/America/Los_Angeles"
fi

# Alias vim, since I use it all the time.
alias v='vim'
alias sv="sudo -E vim"

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

# Enable appending to the history file instead of replacing it (histappend) and
# attempt to save correctly all the lines of a multiple lines command
# (cmdhist).
shopt -s histappend cmdhist

# Checks the window size after each command and, if necessary, update the
# values of the variables LINES and COLUMNS.
shopt -s checkwinsize

# Find out the version of an installed Perl module.
pmver ()
{
	perl -M$1 -e "print \$$1::VERSION, \"\n\""
}
export -f pmver

# Alias for ansible-playbook.
alias ap="ansible-playbook --vault-password-file ~/.vault_password -vv"

# Tail all the possible error logs.
alias errlog'=sudo find /var/local/www_logs/ -type f \( -name "*error.log" \) -exec tail -f /var/log/syslog /var/log/apache2/error.log  "$file" {} +'

# Follow syslog.
alias syslog='less +F /var/log/syslog'

# Filter out noise from the command history.
export HISTIGNORE="&:ls:exit:[ \t]*"

# Increase how much the command history should store.
export HISTSIZE=500000
export HISTFILESIZE=5000000

# Don't use cowsay for ansible, to keep the logs shorter.
export ANSIBLE_NOCOWS=1

# Use colors for grep.
alias grep='grep --color=auto'

# Retrieve the public IP of the machine.
alias ip="curl -s http://checkip.dyndns.com/ | sed 's/[^0-9\.]//g'"

# Message of the day.
hline=$(printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | sed -e 's/ /─/g')
echo $hline
uptime
echo $hline
if [ -x /usr/games/fortune ]
then
	if [ -x /usr/games/cowsay ]
	then
		fortune | cowsay
		echo ''
	else
		echo ''
		fortune
		echo $hline
	fi
fi

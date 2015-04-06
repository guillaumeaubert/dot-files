#!/bin/bash

# Git author statistics.
alias gastats='git ls-files -z | xargs -0n1 git blame -w | perl -n -e '"'"'/^.*?\((.*?)\s+[\d]{4}/; print ">$1<\n"'"'"' | sort -f | uniq -c | sort -n'

# Alias vim, since I use it all the time.
alias v='vim'
alias sv="sudo -E vim"

# Display the current directory.
alias p='pwd'

# Alias sudo, since I use it often.
alias s="sudo -E"

# Set up line counter.
alias cloc="perl $HOME/dot-files/tools/cloc-1.60.pl --read-lang-def=$HOME/dot-files/tools/cloc_definitions.txt"

# Alias to inspect memory use.
alias mem="sudo python $HOME/dot-files/tools/ps_mem/ps_mem.py"

# Alias for ansible-playbook.
alias ap="ansible-playbook --vault-password-file ~/.vault_password -vv"

# Tail all the possible error logs.
alias errlog'=sudo find /var/local/www_logs/ -type f \( -name "*error.log" \) -exec tail -f /var/log/syslog /var/log/apache2/error.log  "$file" {} +'

# Follow syslog.
alias syslog='sudo less +F /var/log/syslog'

# Use colors for grep.
alias grep='grep --color=auto'

# Retrieve the public IP of the machine.
alias ip="curl -s http://checkip.dyndns.com/ | sed 's/[^0-9\.]//g'"

# Faster directory navigation.
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias ~='cd ~'
alias ll='tree --dirsfirst -ChFupDaLg 1'

# Reload the shell.
alias reload="exec $SHELL -l"

# Display space in a human-readable format by default.
alias df="df -h"

# Create directories recursively by default.
alias mkdir='mkdir -pv'

# Test CPU.
alias testcpu="sysbench --test=cpu --cpu-max-prime=20000 run"

# Sometimes VirtualBox doesn't auto-start properly and needs to be set up
# again.
alias kickvbox="sudo /etc/init.d/vboxdrv setup && sudo /etc/init.d/vboxweb-service restart"

# Ruby-on-Rails shortcuts.
alias migrate="rake db:migrate"

# Quickly find a file in the current directory or below.
alias ffind="find . -name"

# Exit the vim way.
alias q='logout'
alias :q='logout'

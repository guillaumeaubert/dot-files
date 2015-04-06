#!/bin/bash

# Enable Perlbrew if it is installed.
if [ -d ~/perl5/perlbrew/ ]; then
	source ~/perl5/perlbrew/etc/bashrc
fi

# Enable cpanm if it is installed.
if [ -e ~/perl5/bin/cpanm ]; then
	eval $(perl -I ~/perl5/lib/perl5/ -Mlocal::lib)
fi

# Enable local executables installed by Perl distributions.
if [ -d "$HOME/perl5/bin" ]; then
	PATH="$HOME/perl5/bin:$PATH"
fi

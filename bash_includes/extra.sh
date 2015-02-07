# Enable Perlbrew if it is installed.
if [ -d perl5/perlbrew/ ]; then
	source ~/perl5/perlbrew/etc/bashrc
fi

# Enable cpanm if it is installed.
if [ -e ~/perl5/bin/cpanm ]; then
	~/perl5/bin/cpanm --local-lib=~/perl5 local::lib
	eval $(perl -I ~/perl5/lib/perl5/ -Mlocal::lib)
fi
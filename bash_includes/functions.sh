#!/bin/bash

# Find out the version of an installed Perl module.
pmver()
{
	perl -M"$1" -e "print \$$1::VERSION, \"\n\""
}
export -f pmver

# Full dig information.
dig_all()
{
  dig +nocmd "$1" any +multiline +noall +answer
}
export -f dig_all

# Detail visually how PPI breaks down a Perl document.
ppi()
{
	perl -le '
		use PPI::Document;
		use PPI::Dumper;
		my $ppi_document = PPI::Document->new("'"$1"'");
		PPI::Dumper->new( $ppi_document )->print();
	'
}
export -f ppi

# Allow going up several directories easily.
# shellcheck disable=SC2046,SC2086
up()
{
	cd $(printf "%0.s../" $(seq 1 $1 ));
	pwd
}
export -f up

# Shortcut to create and sync new git branches.
branch()
{
	git checkout -b "$1" && \
	git push origin "$1" && \
	git branch --set-upstream-to="origin/$1" "$1"
}
export -f branch

# Shortcut to create and sync new git tags.
# Note: push first, to make sure that the commits the tag points to exists on
# the remote.
tag()
{
	git push && \
	git tag "$1" && \
	git push origin "$1"
}
export -f tag

# Test the response of a page over time.
loop_curl()
{
	while true
	do
		echo -n '... '
		curl -sL --max-time 10  -w "code=%{http_code} time=%{time_total}s redir=%{num_redirects} dest=%{url_effective} (" "$1" -o /dev/null
		echo -n $?
		echo ')'
		sleep 1
	done
}
export -f loop_curl

# Make a directory and open it.
mkcd()
{
	mkdir -p "$1" && \
	cd "$1"
}
export -f mkcd

# Make an alias to get quickly to the main code directory on the current
# machine.
c()
{
	if [ -e ~/cpan ]
	then
		cd ~/cpan
	elif [ -e ~/trunk ]
	then
		cd ~/trunk
	else
		echo "No code directory found on this machine!"
	fi
}
export -f c

# Create Linux user passwords.
linuxpass()
{
	echo -n "$1" | makepasswd --crypt-md5 --clearfrom -
}

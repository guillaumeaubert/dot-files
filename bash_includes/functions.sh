#!/bin/bash

# Find out the version of an installed Perl module.
pmver ()
{
	perl -M$1 -e "print \$$1::VERSION, \"\n\""
}
export -f pmver

# Full dig information.
dig_all () {
  dig +nocmd $1 any +multiline +noall +answer
}
export -f dig_all

# Detail visually how PPI breaks down a Perl document.
ppi() {
	perl -le '
		use PPI::Document;
		use PPI::Dumper;
		my $ppi_document = PPI::Document->new("'$1'");
		PPI::Dumper->new( $ppi_document )->print();
	'
}
export -f ppi

# Allow going up several directories easily.
up() {
	cd $(eval printf '../'%.0s {1..$1})
	pwd
}
export -f up

# Shortcut to create and sync new git branches.
branch ()
{
	git checkout -b $1
	git push origin $1
	git branch --set-upstream-to=origin/$1 $1
}
export -f branch

# Shortcut to create and sync new git tags.
tag()
{
	git tag $1
	git push origin $1
}
export -f tag

# Test the response of a page over time.
loop_curl()
{
	while [ 1 ]
	do
		echo -n '... '
		curl -sL --max-time 10  -w "code=%{http_code} time=%{time_total}s redir=%{num_redirects} dest=%{url_effective}\\n" "$1" -o /dev/null
		sleep 1
	done
}
export -f loop_curl

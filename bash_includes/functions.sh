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

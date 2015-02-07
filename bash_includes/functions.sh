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

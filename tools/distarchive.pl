#!/usr/bin/env perl

use strict;
use warnings;

use JSON::PP qw();
use Path::Tiny qw();


# Read the metadata to find distribution information.
my $meta_text = Path::Tiny::path( 'META.json' )->slurp_utf8();
my $json = JSON::PP::decode_json( $meta_text );

# Verify version.
my $version = $json->{'version'};
die 'The version must follow the vX.Y.Z format'
		if $version !~ /\Av\d+\.\d+\.\d+\Z/;

# Verify distribution name.
my $name = $json->{'name'};
die 'Could not find the distribution name'
	if !defined( $name ) || ( $name !~ /\w/ );

# Generate archive.
print `git archive --prefix=$name-$version/ HEAD^{tree} | gzip > ~/cpan_archives/$name/$name-$version.tar.gz`;
print "Generated archive for $name $version.\n";

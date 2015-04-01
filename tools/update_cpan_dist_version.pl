#!/usr/bin/env perl

use strict;
use warnings;

use Git::Repository;
use JSON::PP qw();
use Path::Tiny qw();


# Read the metadata to find distribution information.
my $meta_text = Path::Tiny::path( 'META.json' )->slurp_utf8();
my $json = JSON::PP::decode_json( $meta_text );

# Verify the new version passed.
my $new_version = $ARGV[0] // '';
die 'The version must follow the vX.Y.Z format'
	if $new_version !~ /\Av\d+\.\d+\.\d+\Z/;

# Retrieve the current version.
my $old_version = $json->{'version'};
die 'Could not find old version'
	if $old_version !~ /\Av\d+\.\d+\.\d+\Z/;

# Find files with the current version.
my $old_version_git_pattern = $old_version;
$old_version_git_pattern =~ s/^v/v?/;
$old_version_git_pattern =~ s/\./\\./g;
my $repository = Git::Repository->new();
my @files = $repository->run( 'grep', '--files-with-matches', $old_version_git_pattern );

# Replace the old version with the new one in the files found.
$old_version =~ s/^v//;
$new_version =~ s/^v//;
foreach my $file ( @files )
{
	next if $file eq 'Changes';

	my $path = Path::Tiny::path( $file );
	my $text = $path->slurp_utf8();
	$text =~ s/\Q$old_version\E/$new_version/g;
	$path->spew_utf8( $text );
}

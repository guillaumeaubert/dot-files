#!/usr/bin/env perl

use strict;
use warnings;

use Path::Tiny qw();
use Git::Repository;


# Find files that have lines including "use ".
my $repository = Git::Repository->new();
my @files = $repository->run( 'grep', '--files-with-matches', 'use ' );

my $modules_used = {};
foreach my $file ( @files )
{
	# Make sure it is a Perl file.
	next if $file !~ /\.(?:pl|t|pm|cgi)$/;

	# Determine the type of the file - to see if we have a build prereq, or a
	# permanent one.
	my $type = $file =~ /\.t$/
		? 'build_requires'
		: 'requires';

	# Retrieve the content of the file, and find lines that declare the use of a
	# library.
	my $text = Path::Tiny::path( $file )->slurp_utf8();
	while ( my ( $module ) = $text =~ /^\s*use ([^;\s]+)/m )
	{
		$text =~ s/\Quse $module\E[\s;]//g;
		$module =~ s/^\s*//;

		# Skip keywords that are not external dependencies.
		# TODO: exclude modules provided by the distributon itself.
		next if $module =~ /^(?:lib|base|strict|warnings)$/;

		$modules_used->{ $type }->{ $module }++;
	}
}

# Print out report.
print_report( 'build_requires' );
print_report( 'requires' );


=head1 FUNCTIONS

=head2 print_report()

Display the list of prereqs for a given prereq type.

	print_report( $prereq_type );

Valid options for C<$prereq_type> are:

=over 4

=item * requires

=item * build_requires

=back

=cut

sub print_report
{
	my ( $type ) = @_;

	print "$type:\n";
	foreach my $prereq ( sort keys %{ $modules_used->{ $type } } )
	{
		print "    $prereq\n";
	}
}

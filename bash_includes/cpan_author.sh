# Add lib/ to 'prove' and make it recursive by default.
alias prove='prove -I lib -r'

# Add an easy way to test Perl files.
alias t='perl -I lib -T'

# Alias to rebuild my CPAN distributions.
alias distb="perl Build.PL && ./Build && ./Build disttest && ./Build distclean"

# Alias to update the version of a distribution inside a git repository.
alias distver="perl $HOME/dot-files/tools/update_cpan_dist_version.pl"

# Alias to create an archive of a distribution for CPAN.
alias distarchive="perl $HOME/dot-files/tools/create_cpan_archive.pl"

# Alias to upload my CPAN distributions to PAUSE.
alias distupload='cpan-upload --user AUBERTG --verbose'

# Alias to determine prereqs for a Perl distribution.
# This is particularly useful for new distributions, in order to populate the
# lists of prereqs in Build.PL.
alias distprereq="perl $HOME/dot-files/tools/list_distribution_prereqs.pl"

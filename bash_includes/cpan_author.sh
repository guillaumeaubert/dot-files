# Note: a lot of this assumes that you have:
#
#   - a ~/cpan/ directory under which you've cloned the git repositories of
#     your distributions.
#
#   - a ~/cpan_archive/ directory where you store the distribution archives
#     that are going to be uploaded to PAUSE.


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
# Note: don't forget to create ~/.pause with the following format.
#    user <username>
#    password <PAUSE password>
alias distupload='cpan-upload --user AUBERTG --verbose'

# Alias to determine prereqs for a Perl distribution.
# This is particularly useful for new distributions, in order to populate the
# lists of prereqs in Build.PL.
alias distprereq="perl $HOME/dot-files/tools/list_distribution_prereqs.pl"

# Function to run commands on all the distributions found under ~/cpan/.
all_dists()
{
	# Store the original directory to restore it at the end of the run.
	original_dir=$(pwd)

	# The command to run on each distribution.
	command=$@

	# Retrieve all the directories under ~/cpan/.
	dists_found=0
	for dist in ~/cpan/*/; do
		cd $dist

		# Skip directories that are not a git repository.
		if [ ! -d .git ]; then
			continue
		fi
		dists_found=$(($dists_found+1))

		# Run the command on the distribution's repository;
		echo -e "\e[4;35m$dist\e[0m"
		export DIST=$dist
		eval $command
		echo ""
	done

	# Restore the original directory.
	cd $original_dir

	# Print how many distributions were affected.
	echo -e "\e[0;92m✔ $dists_found distributions visited.\e[0m"
}
export -f all_dists

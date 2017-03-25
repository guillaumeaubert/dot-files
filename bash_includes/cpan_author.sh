#!/bin/bash

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
alias distb='perl Build.PL && ./Build && ./Build disttest && ./Build distclean'

# Alias to update the version of a distribution inside a git repository.
alias distver='perl $HOME/dot-files/tools/update_cpan_dist_version.pl'

# Alias to create an archive of a distribution for CPAN.
alias distarchive='perl $HOME/dot-files/tools/create_cpan_archive.pl'

# Alias to upload my CPAN distributions to PAUSE.
# Note: don't forget to create ~/.pause with the following format.
#    user <username>
#    password <PAUSE password>
alias distupload='cpan-upload --user AUBERTG --verbose'

# Alias to determine prereqs for a Perl distribution.
# This is particularly useful for new distributions, in order to populate the
# lists of prereqs in Build.PL.
alias distprereq='perl $HOME/dot-files/tools/list_distribution_prereqs.pl'

# Update copyright year for distributions.
distcopyright()
{
	# shellcheck disable=SC2002,SC2016
	cat MANIFEST | \
	xargs -I % perl -0777 -i -pe 's/(copyright (?:\(c\) )?\d{4})(?:-\d{4})?( (?:by )?Guillaume Aubert)/${1}-2017${2}/ig' %
}
export -f distcopyright

# Function to run commands on all the distributions found under ~/cpan/.
all_dists()
{
	# Store the original directory to restore it at the end of the run.
	original_dir=$(pwd)

	# The command to run on each distribution.
	# shellcheck disable=SC2124
	command=$@

	# Retrieve all the directories under ~/cpan/author/.
	dists_found=0
	for dist in ~/cpan/author/*/; do
		cd "$dist"

		# Skip directories that are not a git repository.
		if [ ! -d .git ]; then
			continue
		fi
		let "dists_found++"

		# Run the command on the distribution's repository;
		echo -e "\e[4;35m($dists_found) $dist\e[0m"
		export DIST=$dist
		eval "$command"
		echo ""
	done

	# Restore the original directory.
	cd "$original_dir"

	# Print how many distributions were affected.
	echo -e "\e[0;92m✔ $dists_found distributions visited.\e[0m"
}
export -f all_dists

# See all the distributions that have unreleased changes and a list of the
# corresponding commits yet to be released.
distunreleased()
{
	all_dists 'git graph `git describe --tags --abbrev=0`..HEAD'
}
export -f distunreleased

# Function to release a CPAN module.
distrelease()
{
	# Make sure we're at the root of the distribution.
	if [ ! -d .git ]; then
		echo "You must be at the root of the distribution"
		return
	fi

	# Find the name of the distribution. I name the root directory the same as
	# the distribution, so that's an easy shortcut. Long term, this should be
	# extracted from one of the meta files in the repository.
	dist_name=${PWD##*/}

	# Find the version number of the release.
	dist_version=$1
	if [ "$dist_version" == "" ]; then
		echo "You must pass a version number"
		return
	fi
	semver_pattern="^v[0-9]+\.[0-9]+\.[0-9]+$"
	if [[ ! ( "$dist_version" =~ $semver_pattern ) ]]; then
		echo "You must pass a version number that follows semantic versioning (vN.N.N)"
		return
	fi

	# Ensure that the distribution builds cleanly and that tests pass.
	distb && \

	# Commit the changelog and version bump info.
	git commit -a -m "Release version $dist_version." && \
	git push && \
	git tag "$dist_version" && \
	git push origin "$dist_version" && \

	# Upload the release to PAUSE.
	distarchive && \
	cd ~/archives/cpan/ && \
	distupload "${dist_name}/${dist_name}-${dist_version}.tar.gz" && \

	# Add the release bundle to the archive repository, so that older releases
	# can be deleted from the PAUSE server.
	git add "${dist_name}/${dist_name}-${dist_version}.tar.gz" && \
	git commit -m "Add ${dist_name} ${dist_version}." && \
	git push && \

	# Go back to the original directory.
	cd "$HOME/cpan/author/$dist_name" && \

	echo -e "\e[0;92m✔ $dist_version release complete.\e[0m"
}
export -f distrelease

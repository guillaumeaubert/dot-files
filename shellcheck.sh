#!/usr/bin/env bash

set -eo pipefail

# Paths to ignore.
shellcheck_skip="
	tools/git-churn.sh
	bash_includes/git-completion.sh
	bash_includes/git-prompt.sh
	vim/undo/
"

# Linting errors to ignore.
export SHELLCHECK_OPTS="-e SC2164"

# Define find_scripts() to exclude files from $shellcheck_skip.
find_scripts() {
	cmd="git ls-tree -r HEAD | egrep '^1007|.*\..*sh$' | awk '{print \$4}'"
	for path in $shellcheck_skip; do
		echo $path
		cmd="$cmd | grep -v '^$path'"
	done
	echo "$cmd"
}

# Protect find_scripts() to prevent ./build/build.sh from redefining it.
readonly -f find_scripts

# Run the linter.
source ./build/build.sh

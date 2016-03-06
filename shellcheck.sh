#!/usr/bin/env bash

set -eo pipefail

# Paths to ignore.
shellcheck_skip="
	./tools/git-churn.sh
	./bash_includes/git-completion.sh
	./bash_includes/git-prompt.sh
	./vim/undo/*
"

# Linting errors to ignore.
export SHELLCHECK_OPTS="-e SC2164"

# Define find_cmd() to exclude files from $shellcheck_skip.
find_cmd() {
	cmd="find . -type f -and \( -perm +111 -or -name '*.sh' \) $(find_prunes)"
	for path in $shellcheck_skip; do
		cmd="$cmd ! -path '$path'"
	done
	echo "$cmd"
}

# Protect find_cmd() to prevent ./build/build.sh from redefining it.
readonly -f find_cmd

# Run the linter.
source ./build/build.sh

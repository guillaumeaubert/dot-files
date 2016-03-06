#!/usr/bin/env bash

# Based on https://github.com/caarlos0/shell-ci-build.

set -eo pipefail


### CONFIGURATION

# Paths to ignore.
shellcheck_skip="
	tools/git-churn.sh
	bash_includes/git-completion.sh
	bash_includes/git-prompt.sh
	vim/undo/
"

# Linting errors to ignore.
export SHELLCHECK_OPTS="-e SC2164"


### FUNCTIONS

success() {
  printf "\r  [ \033[00;32mOK\033[0m ] Linting %s...\n" "$1"
}

fail() {
  printf "\r  [\033[0;31mFAIL\033[0m] Linting %s...\n" "$1"
  exit 1
}

info() {
  printf "\r  [ \033[00;34m??\033[0m ] %s\n" "$1"
}

check() {
  local script="$1"
  shellcheck "$script" || fail "$script"
  success "$script"
}

is_compatible() {
  head -n1 "$1" | egrep -w "sh|bash|ksh" > /dev/null 2>&1
}

is_excluded() {
	file=$1
	for path in $shellcheck_skip; do
		if [[ $file =~ ^$path ]]; then
			return 0
		fi
	done
	return 1
}

find_scripts() {
  git ls-tree -r HEAD | egrep '^1007|.*\..*sh$' | awk '{print $4}'
}


check_all_executables() {
  echo "Linting all executables and .*sh files..."
  find_scripts | while read -r script; do
		if is_excluded "$script"; then
			info "Excluded in config: $script."
		else
	    if is_compatible "$script"; then
	      check "$script"
	    else
	      info "Not compatible: $script."
	    fi
		fi
  done
}


### MAIN

# If being executed, check all executables, otherwise do nothing.
if [ $SHLVL -gt 1 ]; then
  check_all_executables
else
  return 0
fi

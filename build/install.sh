#!/bin/bash

set -eo pipefail

SHELLCHECK_VERSION="0.4.4-4"

main() {
	local filename="shellcheck_${SHELLCHECK_VERSION}_amd64.deb"
	wget "http://ftp.debian.org/debian/pool/main/s/shellcheck/$filename"
	sudo dpkg -i "$filename"
}

main

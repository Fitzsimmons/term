#!/bin/bash

set -euo pipefail

extraction_dir=$(mktemp -d)

function finish {
  rm -rf $extraction_dir
}
trap finish EXIT

UTILS=(
	sharkdp/bat
	Peltoche/lsd
	sharkdp/fd
	BurntSushi/ripgrep
)

function releases_url() {
	echo "https://api.github.com/repos/$1/releases/latest"
}

function download_url() {
	echo $(curl -L -s $(releases_url $1) | jq -r '.assets | map(select(.name | contains("x86_64-unknown-linux-gnu") or contains("x86_64-unknown-linux-musl")))[0].browser_download_url')
}

mkdir -p "$HOME/bin"

for util in ${UTILS[@]}; do
	echo "Fetching $util ..."
	curl -L -s $(download_url $util) | tar xz --strip-components 1 -C $extraction_dir
done

find $extraction_dir -maxdepth 1 -type f -executable -exec mv {} $HOME/bin \;

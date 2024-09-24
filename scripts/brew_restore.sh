#!/bin/bash
# please provide env var first
pkg_list="${PACKAGES_FILE}"

mapfile -t shuffled_packages < <(awk 'BEGIN {srand()} {print rand() "\t" $0}' "$pkg_list" | sort -k1,1n | cut -f2-)

for package in "${shuffled_packages[@]}"; do
  (
    echo "Installing package: $package"
    HOMEBREW_NO_AUTO_UPDATE=1
    brew install "$package"
  ) &
done
wait

#brew install $(cat "$pkg_list")

#!/bin/bash
# please provide env var first
pkg_list="${PACKAGES_FILE}"

while IFS= read -r package; do
  (
  	echo "Installing package: $package";
    HOMEBREW_NO_AUTO_UPDATE=1
  	brew install "$package";
  )
done < "$pkg_list"
wait

#brew install $(cat "$pkg_list")
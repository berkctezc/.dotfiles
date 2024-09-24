#!/bin/bash
# please provide env var first
pkg_list="${PACKAGES_FILE}"

shuf "$pkg_list" | while IFS= read -r package; do
  (
    echo "Installing package: $package"
    HOMEBREW_NO_AUTO_UPDATE=1
    brew install "$package"
  ) &
done
wait

#brew install $(cat "$pkg_list")

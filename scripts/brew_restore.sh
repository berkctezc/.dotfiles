#!/bin/bash
# please provide env var first
pkg_list="$PACKAGES_FILE"

# while IFS= read -r package; do
#     echo "Installing package: $package"
#     brew install "$package"
# done < "$pkg_list"

brew install $(cat "$pkg_list")

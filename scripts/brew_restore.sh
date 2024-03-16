#!/bin/bash
# please provide env var first
pkg_list="$PACKAGES_FILE"

# while IFS= read -r package; do
#     echo "Installing package: $package"
#     brew install "$package"
# done < "$pkg_list"

brew install $(cat "$pkg_list")

# alternative with loop (for skipping packages that are not found)
# while IFS= read -r package; do HOMEBREW_NO_AUTO_UPDATE=1 brew install "$package"; done < $pkg_list

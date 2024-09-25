#!/bin/bash

if [ $# -eq 0 ]; then
    echo "Usage: $0 <path_to_formulae_file> <path_to_casks_file>"
    exit 1
fi

formulae_file="$1"
casks_file="$2"

if [ ! -f "$formulae_file" ] || [ ! -f "$casks_file" ]; then
    echo "Error: One or both input files not found."
    exit 1
fi

error_log="brew_install_errors.log"
> "$error_log"

install_package() {
    local package_type="$1"
    local package="$2"
    local install_cmd="brew install"
    
    if [ "$package_type" == "cask" ]; then
        install_cmd="brew install --cask"
    fi
    
    if ! HOMEBREW_NO_AUTO_UPDATE=1 $install_cmd "$package" > /dev/null 2>&1; then
        echo "Failed to install $package_type: $package" >> "$error_log"
        return 1
    fi
    return 0
}

# Install formulae
echo "Installing formulae..."
formulae_count=0
formulae_failed=0
while IFS= read -r package; do
    echo "Installing formula: $package"
    if install_package "formula" "$package"; then
        ((formulae_count++))
    else
        ((formulae_failed++))
    fi
done < "$formulae_file"

# Install casks
echo "Installing casks..."
casks_count=0
casks_failed=0
while IFS= read -r package; do
    echo "Installing cask: $package"
    if install_package "cask" "$package"; then
        ((casks_count++))
    else
        ((casks_failed++))
    fi
done < "$casks_file"

echo "Restoration attempt complete."
echo "Formulae installed successfully: $formulae_count"
echo "Formulae failed to install: $formulae_failed"
echo "Casks installed successfully: $casks_count"
echo "Casks failed to install: $casks_failed"

if [ -s "$error_log" ]; then
    echo "Some installations failed. Check $error_log for details."
else
    echo "All packages installed successfully."
    rm "$error_log"
fi
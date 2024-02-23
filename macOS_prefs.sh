# Free the Dock
defaults write com.apple.Dock size-immutable -bool no; killall Dock

# Set the icon size of Dock items
defaults write com.apple.Dock tilesize -int 28

# Set iTerm2 preferences directory
defaults write com.googlecode.iterm2.plist PrefsCustomFolder -string "~/.dotfiles/.iterm2"

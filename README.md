# Managing dotfiles

## Requirements

stow, git

```shell
# Brew (Darwin or Linux)
brew install git stow
# Arch Linux
sudo pacman -Sy git stow --noconfirm
# Debian or Ubuntu
sudo apt install git stow -y
```

## Initialization

- Dump all desired config etc. files to a folder created with a name you wish

- use command `stow .`

  - I would recommend you to use `--ignore='.DS_Store'` if on mac

- Initialize git repository and go on

## Restoration from remote repository

```bash
# clone and enter directory
git clone https://github.com/berkctezc/.dotfiles
  && cd .dotfiles;
# adopt command is for solving conflicts between
# already existing files and the ones you pulled
stow . --adopt;
# after adopting use git reset to overwrite existing
# files with the ones from the repo
git reset --hard;
```

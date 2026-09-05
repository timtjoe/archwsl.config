
# Arch WSL Config

My setup for Arch Linux on WSL.

## Usage
1. Clone:
   git clone git@github.com:timtjoe/archwsl.config ~/dotfiles

2. Symlink configs:
   ln -sf ~/dotfiles/bashrc ~/.bashrc
   ln -sf ~/dotfiles/bash_profile ~/.bash_profile
   ln -sf ~/dotfiles/gitconfig ~/.gitconfig

3. Bootstrap:
   bash ~/dotfiles/bootstrap.sh

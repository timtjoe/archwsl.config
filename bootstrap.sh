#!/bin/bash
# Arch WSL bootstrap script
# Personal setup for timtjoe

# Update system
sudo pacman -Syu --noconfirm

# Restore packages from pkglist.txt
if [ -f ~/dotfiles/pkglist.txt ]; then
  sudo pacman -S --needed - < ~/dotfiles/pkglist.txt
else
  echo "pkglist.txt not found, skipping package restore"
fi

# Symlink configs using GNU Stow
cd ~/dotfiles
stow bash
stow git
stow ssh

echo "Bootstrap complete — system updated, packages restored, configs linked."

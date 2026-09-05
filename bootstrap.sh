#!/bin/bash

#update system
sudo pacman -Syu --noconfirm

#restore package list
sudo pacman -S --needed - < ~/dotfiles/pkglist.txt

# recreate package list
ln -sf ~/dotfiles/bashrc ~/.bashrc
ln -sf ~/dotfiles/bash_profile ~/.bash_profile
ln -sf ~/dotfiles/gitconfig ~/.gitconfig

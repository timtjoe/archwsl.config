#!/bin/bash
# Update system
sudo pacman -Syu --noconfirm

# Install essentials
sudo pacman -S --noconfirm go nodejs npm git python unzip less nano openssh

# Install Bun
curl -fsSL https://bun.sh/install | bash

# Install Deno
curl -fsSL https://deno.land/install.sh | sh

# Reload configs
source ~/.bashrc

# Git defaults
git config --global user.name "TimJoe"
git config --global user.email "ttjoe0@gmail.com"

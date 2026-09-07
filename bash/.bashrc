#Custom PATHs
export PATH="$HOME/.bun/bin:$PATH"
export PATH="$HOME/.deno/bin:$PATH"

# Default umask
umask 022

# Aliases
alias ll='ls -alF'
alias gs='git status'
alias gl='git log --oneline'

# Install into a category (like pac dev -Syu pkg)
pac() {
  local category="$1"
  shift
  local list="$HOME/dotfiles/packages/${category}.txt"

  if [[ ! -f "$list" ]]; then
    echo "No such category: $category"
    return 1
  fi

  # Install with pacman
  sudo pacman -Syu "$@"

  # Append to category list if not already present
  for pkg in "$@"; do
    if ! grep -qx "$pkg" "$list"; then
      echo "$pkg" >> "$list"
      echo "Added $pkg to $category list."
    fi
  done
}

# Install all packages from a category
pacgroup() {
  local category="$1"
  local list="$HOME/dotfiles/packages/${category}.txt"
  if [[ -f "$list" ]]; then
    sudo pacman -S --needed --noconfirm $(< "$list")
    echo "Installed all packages from $category."
  else
    echo "No such category: $category"
  fi
}

# Wrapper for removals 
pacr() {
sudo pacman -R "$@"
pacman -Qqe > ~/dotfiles/pkglist.txt
echo "pkglist.txt update after removal."
}

# Add package to a category
pacadd() {
  local category="$1"
  shift
  local list="$HOME/dotfiles/packages/${category}.txt"
  for pkg in "$@"; do
    if ! grep -qx "$pkg" "$list"; then
      echo "$pkg" >> "$list"
      echo "Added $pkg to $category."
    else
      echo "$pkg already in $category."
    fi
  done
}

# Combine all categories into one master list
pacmerge() {
  local pkgdir="$HOME/dotfiles/packages"
  cat "$pkgdir"/core.txt "$pkgdir"/dev.txt "$pkgdir"/extras.txt \
    | sort -u > "$pkgdir/all.txt"
  echo "Merged categories into all.txt"
}

# Install from master list
pacall() {
  local pkgdir="$HOME/dotfiles/packages"
  if [[ -f "$pkgdir/all.txt" ]]; then
    sudo pacman -S --needed --noconfirm $(< "$pkgdir/all.txt")
    echo "Installed packages from all.txt"
  else
    echo "Run pacmerge first to generate all.txt"
  fi
}

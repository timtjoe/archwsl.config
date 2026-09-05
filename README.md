# Arch WSL Config

My setup for Arch Linux on WSL.

## Usage
1. Clone:
   ```bash
   git clone git@github.com:timtjoe/archwsl.config ~/dotfiles
   ```

2. Stow configs:
   ```bash
   cd ~/dotfiles
   stow bash git ssh
   ```

3. Bootstrap:
   ```bash
   bash ~/dotfiles/bootstrap.sh
   ```

## Best Practice Workflow
- Keep configs in `~/dotfiles` subfolders (`bash/`, `git/`, `ssh/`).
- Use GNU Stow to symlink into `~`.
- Edit configs normally — changes are tracked in Git.
- Export package list after installs:
  ```bash
  pacman -Qqe > ~/dotfiles/pkglist.txt
  ```
- Commit and push to keep everything portable.
- On a new PC: clone → bootstrap → done.

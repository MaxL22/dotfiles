#!/usr/bin/env bash

set -eo pipefail

REPO_URL="${1:-https://github.com/MaxL22/dotfiles}"
TARGET_DIR="$HOME"
BARE_DIR="$HOME/.dotfiles.git"
BACKUP_DIR="$HOME/.dotfiles-backup/$(date +%Y%m%d_%H%M%S)"

if ! command -v git &> /dev/null; then
    echo "Error: Git not installed."
    exit 1
fi

if [ -d "$BARE_DIR" ]; then
    echo "Bare repo directory already exists at $BARE_DIR"
    exit 1
fi

# Helper function for the repo
config() {
    git --git-dir="$BARE_DIR" --work-tree="$TARGET_DIR" "$@"
}

git clone --bare "$REPO_URL" "$BARE_DIR"

# This checks if there are conflicts and backs them up
if ! config checkout 2>/dev/null; then
    echo "Backing up conflicting files to $BACKUP_DIR"
    
    mkdir -p "$BACKUP_DIR"

    config checkout 2>&1 | \
      grep -E "^\s+\." | \
      awk '{print $1}' | \
      while read -r file; do
        if [ -e "$TARGET_DIR/$file" ]; then
            mkdir -p "$BACKUP_DIR/$(dirname "$file")"
            mv "$TARGET_DIR/$file" "$BACKUP_DIR/$file"
            echo "Moved: $file"
        fi
    done

    config checkout
fi

# Ignore untracked files in home
config config --local status.showUntrackedFiles no

echo "Check the alias:"
echo "alias dotfiles='/usr/bin/git --git-dir=\$HOME/.dotfiles.git/ --work-tree=\$HOME'"
echo "Installation done"

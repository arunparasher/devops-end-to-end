#!/bin/bash
set -e

### --- Git Config (auto-applied if missing) --- ###
if ! git config --global user.name >/dev/null; then
    git config --global user.name "Arun Vanam"
fi

if ! git config --global user.email >/dev/null; then
    git config --global user.email "arun.vanam@outlook.com"
fi

git config --global init.defaultBranch main


### --- Inventory Sync --- ###
SRC="/root/playbooks/inventory"
DEST="$HOME/inventory"
REPO_DIR="$DEST"

# Ensure destination exists
sudo mkdir -p "$DEST"

# Copy (overwrite existing)
sudo cp -r "$SRC"/* "$DEST"/

# Fix permissions
sudo chown -R "$USER:$USER" "$DEST"

cd "$REPO_DIR"

### --- Initialize Git Repo if Missing --- ###
# if [ ! -d .git ]; then
#     git init
#     git branch -M main
#     git remote add origin git@github.com:arunparasher/devops-end-to-end.git
# fi

### --- Commit + Push if Changes Exist --- ###

git add .

if ! git diff --cached --quiet; then
    git commit -m "Inventory sync: $(date -u +"%Y-%m-%d %H:%M:%S UTC")"
    git push https://$GIT_TOKEN@github.com/arunparasher/devops-end-to-end.git main
fi
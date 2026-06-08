#!/bin/bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

set -e

# dotfiles directory
dir=~/dotfiles
olddir=~/dotfiles_old/$(date +%Y%m%d-%H%M%S)

# list of files to symlink in homedir (target name is .$file)
files="zshrc gitconfig git-completion.bash ackrc inputrc"

# list of Claude Code files to symlink. Each entry is "<src-relative-to-dotfiles>:<absolute-target>".
claude_files=(
    "claude/settings.json:$HOME/.claude/settings.json"
    "claude/statusline.sh:$HOME/.claude/statusline.sh"
    "claude/skills/stack-overflow-search.md:$HOME/.claude/skills/stack-overflow-search.md"
    "claude/skills/babysit-pr:$HOME/.claude/skills/babysit-pr"
    "claude/plugins/known_marketplaces.json:$HOME/.claude/plugins/known_marketplaces.json"
)

# Back up an existing target (file or directory) into $olddir, preserving its
# relative path under $HOME. Symlinks are removed outright since there's nothing
# to preserve.
backup_target() {
    local target=$1
    if [ -L "$target" ]; then
        rm "$target"
    elif [ -e "$target" ]; then
        local rel=${target#$HOME/}
        mkdir -p "$olddir/$(dirname "$rel")"
        mv "$target" "$olddir/$rel"
        printf "  backed up %s -> %s/%s\n" "$target" "$olddir" "$rel"
    fi
}

link() {
    local src=$1 target=$2
    mkdir -p "$(dirname "$target")"
    backup_target "$target"
    ln -s "$src" "$target"
    printf "  ln -s %s %s\n" "$src" "$target"
}

echo -n "Changing to the $dir directory ..."
cd "$dir"
echo "done"

printf '\e[1;34m%-6s\e[m\n' "Linking top-level dotfiles"
for file in $files
do
    link "$dir/$file" "$HOME/.$file"
done

printf '\e[1;34m%-6s\e[m\n' "Setting up Claude Code configuration"
for entry in "${claude_files[@]}"
do
    src=${entry%%:*}
    target=${entry#*:}
    link "$dir/$src" "$target"
done

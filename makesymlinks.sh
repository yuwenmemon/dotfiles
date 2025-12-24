#!/bin/bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

# dotfiles directory
dir=~/dotfiles

# list of files to symlink in homedir
files="zshrc gitconfig git-completion.bash ackrc inputrc"

# change to the dotfiles directory
echo -n "Changing to the $dir directory ..."
cd $dir
echo "done"

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks from the homedir to any files in the ~/dotfiles directory specified in $files
printf '\e[1;34m%-6s\e[m' "Removing existing dotfiles"
printf "\n"
for file in $files
do
    rm ~/.$file
done

printf '\e[1;34m%-6s\e[m' "Creating symlink to files in home directory"
printf "\n"
for file in $files
do
    printf "ln -s $dir/$file  ~/.$file\n"
    ln -s $dir/$file ~/.$file
done

# Claude Code configuration
printf '\e[1;34m%-6s\e[m' "Setting up Claude Code configuration"
printf "\n"
mkdir -p ~/.claude
for file in settings.json statusline.sh
do
    rm -f ~/.claude/$file
    printf "ln -s $dir/claude/$file  ~/.claude/$file\n"
    ln -s $dir/claude/$file ~/.claude/$file
done

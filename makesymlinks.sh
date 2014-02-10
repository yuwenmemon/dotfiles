#!/bin/bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

########## Variables

dir=~/dotfiles                      # dotfiles directory
olddir=~/dotfiles_old               # old dotfiles backup directory
files="bashrc vimrc vim gitconfig bash_profile aliases"  # list of files/folders to symlink in homedir

##########

# create dotfiles_old in homedir
echo -n "Creating $olddir for backup of any existing dotfiles in ~ ..."
mkdir -p $olddir
echo "done"

# change to the dotfiles directory
echo -n "Changing to the $dir directory ..."
cd $dir
echo "done"
printf "\n\n"

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks from the homedir to any files in the ~/dotfiles directory specified in $files
printf '\e[1;34m%-6s\e[m' "Removing existing backup files"
printf "\n"
for file in $files; do
    rm $olddir/$file
done
printf "\n\n"

printf '\e[1;34m%-6s\e[m' "Moving any existing dotfiles from $dir to $olddir"
printf "\n"
for file in $files; do
    mv ~/$file $olddir/$file
done
printf "\n\n"

printf '\e[1;34m%-6s\e[m' "Creating symlink to $file in home directory"
printf "\n"
for file in $files; do
    ln -s $dir/$file ~/.$file
done
printf "\n\n"

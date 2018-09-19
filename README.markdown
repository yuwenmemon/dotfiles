Dotfiles
========
Forked and inspired from [michaeljsmalley/dotfiles](https://github.com/michaeljsmalley/dotfiles)/[cead22/dotfiles](https://github.com/cead22/dotfiles),
this repository includes my custom dotfiles.

They should be cloned to your home directory so that the path is `~/dotfiles/`.
The included setup script creates symlinks from your home directory to the files
which are located in `~/dotfiles/`.

The setup script is smart enough to back up your existing dotfiles into a
`~/dotfiles_old/` directory if you already have any dotfiles of the same name as
the dotfile symlinks being created in your home directory.

Installation
------------

``` bash
git clone git://github.com/bondydaa/dotfiles ~/dotfiles
cd ~/dotfiles
./makesymlinks.sh
```

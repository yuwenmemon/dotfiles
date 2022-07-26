Dotfiles
========
Forked and inspired from [michaeljsmalley/dotfiles](https://github.com/michaeljsmalley/dotfiles)/[cead22/dotfiles](https://github.com/cead22/dotfiles)/[bondydaa/dotfiles](https://github.com/bondydaa/dotfiles)/[thienlnam/dotfiles](https://github.com/thienlnam/dotfiles),
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
git clone https://github.com/thienlnam/dotfiles.git ~/dotfiles
cd ~/dotfiles
./makesymlinks.sh
```

Ctags
------------
Use universal-ctags: [https://github.com/universal-ctags/ctags](https://github.com/universal-ctags/ctags)

Less Syntax Highlight
------------
1. Install Boost libs in home dir [https://www.boost.org/doc/libs/1_75_0/more/getting_started/unix-variants.html#link-your-program-to-a-boost-library](https://www.boost.org/doc/libs/1_75_0/more/getting_started/unix-variants.html#link-your-program-to-a-boost-library)
1. Install [http://www.gnu.org/software/src-highlite/](http://www.gnu.org/software/src-highlite/) in home dir

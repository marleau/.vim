## Installation ##

Clone .vim folder:

    git clone git://github.com/marleau/.vim.git ~/.vim

Switch to the `~/.vim` directory, and fetch submodules:

    cd ~/.vim
    git submodule init
    git submodule update

Create symlinks:

    ln -s ~/.vim/vimrc ~/.vimrc
    ln -s ~/.vim/pathogen/autoload/pathogen.vim ~/.vim/autoload/pathogen.vim

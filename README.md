# linux-env
Basic config files and scripts required in a new Ubuntu installation

Installation
------------

bashrc:
source this script from ~/.bashrc

gitconfig:
Add the following lines to ~/.gitconfig. Please note that $HOME does not work here.

[include]
    path = ~/linux-env/gitconfig


vimrc:
Include the customized vimrc from your ~/.vimrc with the following line

source $HOME/linux-env/vimrc

#!/bin/sh

# vim
sudo apt-get install git curl
mkdir -p ~/.vim/bundle
cd ~/.vim/bundle
git clone https://github.com/VundleVim/Vundle.vim.git

# pyenv
cd
curl -L https://raw.githubusercontent.com/yyuu/pyenv-installer/master/bin/pyenv-installer | bash

# oh-my-zsh
cd
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"


#!/bin/bash

# Set up environment
mkdir -p ~/.vim/.undo ~/.vim/.swap ~/.vim/.backup
mkdir -p ~/.vim/org
mkdir -p ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
printf "/tags\n/.ctags\n*~\n/.gutctags\n.ignore" >> ~/.gitignore
git config --global core.excludesfile ~/.gitignore

# OS-dependent:
#sudo apt-get install silversearcher-ag
#sudo zypper install the_silver_searcher

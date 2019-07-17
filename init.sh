#!/bin/bash

# Set up environment
mkdir -p ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
printf "/tags\n*~" >> ~/.gitignore
git config --global core.excludesfile ~/.gitignore
mkdir -p ~/.vim/.undo ~/.vim/.swap ~/.vim/.backup

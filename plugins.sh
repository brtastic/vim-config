#!/bin/bash

# Set up environment
#mkdir -p ~/.vim/autoload ~/.vim/bundle && \
#curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
#git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
#~/.fzf/install
#printf "tags\n*~" >> ~/.gitignore
#git config --global core.excludesfile ~/.gitignore

# Clone plugins
cd ~/.vim/bundle
git clone git@github.com:ludovicchabant/vim-gutentags.git
git clone git@github.com:junegunn/fzf.git
git clone git@github.com:universal-ctags/ctags.git
git clone git@github.com:brtastic/vim-simple-workspace.git
git clone git@github.com:scrooloose/nerdtree.git
git clone git@github.com:vim-scripts/taglist.vim.git
git clone git@github.com:vim-airline/vim-airline.git
git clone git@github.com:t9md/vim-choosewin.git
git clone git@github.com:moll/vim-bbye.git
git clone git@github.com:dracula/vim.git
git clone git@github.com:lucasicf/vim-smooth-scroll.git

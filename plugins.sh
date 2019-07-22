#!/bin/bash

# Clone plugins
cd ~/.vim/bundle
git clone git@github.com:ludovicchabant/vim-gutentags.git
git clone git@github.com:junegunn/fzf.git
git clone git@github.com:junegunn/fzf.vim.git
git clone git@github.com:universal-ctags/ctags.git
git clone git@github.com:brtastic/vim-simple-workspace.git
git clone git@github.com:scrooloose/nerdtree.git
git clone git@github.com:majutsushi/tagbar.git
git clone git@github.com:vim-airline/vim-airline.git
git clone git@github.com:moll/vim-bbye.git
git clone git@github.com:morhetz/gruvbox.git
git clone git@github.com:kana/vim-smartword.git
git clone git@github.com:mileszs/ack.vim.git
git clone git@github.com:tpope/vim-commentary.git
git clone git@github.com:sumpygump/php-documentor-vim.git
mv php-documentor-vim/ftplugin/php_documentor.vim php-documentor-vim/ftplugin/php.vim

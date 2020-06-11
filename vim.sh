#!/usr/bin/env bash

mkdir -p ~/.vim/.undo ~/.vim/.swap ~/.vim/.backup
mkdir -p ~/.vim/org
mkdir -p ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

# Clone plugins
cd ~/.vim/bundle

# Must have
git clone https://github.com/junegunn/fzf.git
git clone https://github.com/junegunn/fzf.vim.git
git clone https://github.com/scrooloose/nerdtree.git
git clone https://github.com/moll/vim-bbye.git
git clone https://github.com/morhetz/gruvbox.git

# Nice to have
git clone https://github.com/ludovicchabant/vim-gutentags.git
git clone https://github.com/universal-ctags/ctags.git
git clone https://github.com/sheerun/vim-polyglot.git
git clone https://github.com/tpope/vim-commentary.git
git clone https://github.com/tpope/vim-fugitive.git
git clone https://github.com/tpope/vim-surround.git

# Optional
git clone https://github.com/eugen0329/vim-esearch.git
git clone https://github.com/kana/vim-smartword.git
git clone https://github.com/sumpygump/php-documentor-vim.git
git clone https://github.com/brtastic/vim-simple-workspace.git
git clone https://github.com/brtastic/vorg.git
git clone https://github.com/brtastic/vim-jsonviewer.git

# fix broken plugin
mv php-documentor-vim/ftplugin/php_documentor.vim php-documentor-vim/ftplugin/php.vim

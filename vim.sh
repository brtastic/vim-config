#!/usr/bin/env sh

mkdir -p ~/.vim/.undo ~/.vim/.swap ~/.vim/.backup
mkdir -p ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

# Clone plugins
cd ~/.vim/bundle

# Must have - vim won't function properly without those
git clone https://github.com/junegunn/fzf.git
git clone https://github.com/junegunn/fzf.vim.git
git clone https://github.com/scrooloose/nerdtree.git
git clone https://github.com/moll/vim-bbye.git
git clone https://github.com/morhetz/gruvbox.git
git clone https://github.com/bbrtj/vim-fthelpers.git

# Nice to have - very high value to my vim workflow
git clone https://github.com/ludovicchabant/vim-gutentags.git
git clone https://github.com/tpope/vim-commentary.git
git clone https://github.com/tpope/vim-fugitive.git
git clone https://github.com/tpope/vim-surround.git
git clone https://github.com/editorconfig/editorconfig-vim
git clone https://github.com/eugen0329/vim-esearch.git

# Optional - only occasionally useful
git clone https://github.com/majutsushi/tagbar.git
git clone https://github.com/bbrtj/vim-vorg-md.git
git clone https://github.com/bbrtj/vim-jsonviewer.git
git clone https://github.com/mattn/emmet-vim
git clone https://github.com/tpope/vim-repeat


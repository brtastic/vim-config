#!/usr/bin/env bash

# Set up environment

sudo zypper update
sudo zypper install gmp-devel patch xf86-video-intel freetype fontconfig gcc gvim xorg-x11-devel ncurses-devel tmux feh tree ctags htop the_silver_searcher xbindkeys MozillaThunderbird file-roller stalonetray gimp ranger nomacs xbacklight make xcompmgr xinput screenshot-tool

mkdir ~/config/backup
mv ~/.vimrc ~/config/backup/
mv ~/.bashrc ~/config/backup/
mv ~/.tmux.conf ~/config/backup/
mv ~/.Xresources ~/config/backup/
mv ~/.xinitrc ~/config/backup/
mv ~/.xbindkeysrc ~/config/backup/
mv ~/.gitignore ~/config/backup/
mv ~/.config/nvim/init.vim ~/config/backup/

mkdir -p ~/.config/nvim
ln -s ~/config/dotfiles/neovim ~/.config/nvim/init.vim
ln -s ~/config/dotfiles/bashrc ~/.bashrc
ln -s ~/config/dotfiles/vimrc ~/.vimrc
ln -s ~/config/dotfiles/tmux.conf ~/.tmux.conf
ln -s ~/config/dotfiles/Xresources ~/.Xresources
ln -s ~/config/dotfiles/xinitrc ~/.xinitrc
ln -s ~/config/dotfiles/xbindkeysrc ~/.xbindkeysrc
ln -s ~/config/dotfiles/gitignore ~/.gitignore

git config --global core.excludesfile ~/.gitignore
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install


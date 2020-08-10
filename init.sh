#!/usr/bin/env sh

# Set up environment

doas pkg install git xorg ncurses tmux pkgconf freetype2 fontconfig patch tree universal-ctags htop neofetch xbindkeys stalonetray the_silver_searcher py37-ranger firefox xf86-video-intel slock dmenu intel-backlight networkmgr freefont-ttf libsynaptics slim pavucontrol xclip thunderbird gimp-app feh file-roller gmp scrot bash xcompmgr neovim fusefs-ntfs drm-kmod twemoji-color-font-ttf ja-font-std zh-font-std

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
ln -s ~/config/dotfiles/perltidyrc ~/.perltidyrc

git config --global core.excludesfile ~/.gitignore
git config --global user.name brtastic
git config --global user.email brtastic.dev@gmail.com
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

cp ~/config/local_config.example.sh ~/config/local_config.sh

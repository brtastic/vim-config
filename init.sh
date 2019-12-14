#!/bin/bash

# Set up environment

sudo zypper update
sudo zypper install gmp-devel xf86-video-intel freetype fontconfig gcc gvim xorg-x11-devel ncurses-devel tmux feh compton tree ctags htop the_silver_searcher xbindkeys perl-App-perlbrew vivaldi-stable MozillaThunderbird telegram-desktop thunar thunar-plugin-archive file-roller ristretto xfce4-screenshooter stalonetray

mkdir ~/config/backup
mv ~/.vimrc ~/config/backup/
mv ~/.tmux.conf ~/config/backup/
mv ~/.Xresources ~/config/backup/
mv ~/.xinitrc ~/config/backup/
mv ~/.xbindkeysrc ~/config/backup/
mv ~/.gitignore ~/config/backup/

ln -s ~/config/.vimrc ~/.vimrc
ln -s ~/config/.tmux.conf ~/.tmux.conf
ln -s ~/config/.Xresources ~/.Xresources
ln -s ~/config/.xinitrc ~/.xinitrc
ln -s ~/config/.xbindkeysrc ~/.xbindkeysrc
ln -s ~/config/.gitignore.global ~/.gitignore

mkdir -p ~/.vim/.undo ~/.vim/.swap ~/.vim/.backup
mkdir -p ~/.vim/org
mkdir -p ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

git config --global core.excludesfile ~/.gitignore
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

sudo ln -s ~/config/scripts/pstatus /usr/local/bin/pstatus
sudo ln -s ~/config/scripts/vim-workspace /usr/local/bin/vim-workspace

~/config/plugins.sh

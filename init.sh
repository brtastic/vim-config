#!/bin/bash

# Set up environment

sudo zypper update
sudo zypper install gmp-devel patch xf86-video-intel freetype fontconfig gcc gvim xorg-x11-devel ncurses-devel tmux feh compton tree ctags htop the_silver_searcher xbindkeys vivaldi-stable MozillaThunderbird telegram-desktop file-roller stalonetray gimp ranger screenshot-tool nomacs

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

\curl -L https://install.perlbrew.pl | bash
echo "source ~/perl5/perlbrew/etc/bashrc" >> ~/.bashrc
echo "export FZF_DEFAULT_COMMAND='ag -l \"\"'" >> ~/.bashrc

sudo ln -s ~/config/scripts/pstatus /usr/local/bin/pstatus
sudo ln -s ~/config/scripts/schedule /usr/local/bin/schedule
sudo ln -s ~/config/scripts/vim-workspace /usr/local/bin/vim-workspace

~/config/plugins.sh

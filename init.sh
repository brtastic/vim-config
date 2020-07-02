#!/usr/local/bin/bash

# Set up environment

doas pkg install git xorg dbus ncurses tmux pkgconf freetype2 fontconfig patch tree ctags htop neofetch xbindkeys stalonetray the_silver_searcher py37-ranger firefox xf86-video-intel slock dmenu intel-backlight networkmgr freefont-ttf libsynaptics xdm pavucontrol xclip
# sudo zypper install gmp-devel patch xf86-video-intel freetype fontconfig gcc gvim xorg-x11-devel ncurses-devel tmux feh tree ctags htop the_silver_searcher xbindkeys vivaldi-stable MozillaThunderbird telegram-desktop file-roller stalonetray gimp ranger screenshot-tool nomacs

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

# curl -L https://install.perlbrew.pl | bash

doas ln -s ~/config/scripts/pstatus /usr/local/bin/pstatus
doas ln -s ~/config/scripts/schedule /usr/local/bin/schedule
doas ln -s ~/config/scripts/vim-workspace /usr/local/bin/vim-workspace
doas echo 'kern.vty=vt' >> /boot/loader.conf
doas echo 'hw.psm.elantech_support="1"' >> /boot/loader.conf
doas echo 'export LANG=fr_FR.UTF-8' >> /etc/profile
doas echo 'export MM_CHARSET=UTF-8' >> /etc/profile
~/config/plugins.sh

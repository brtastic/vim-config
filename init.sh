#!/usr/bin/env sh

# Set up environment

doas pkg install git xorg ncurses tmux pkgconf freetype2 fontconfig patch tree universal-ctags htop neofetch xbindkeys stalonetray the_silver_searcher py38-ranger firefox xf86-video-intel slock dmenu intel-backlight wpa_supplicant_gui freefont-ttf libsynaptics slim slim-freebsd-dark-theme pavucontrol xclip thunderbird gimp-app feh file-roller gmp gnome-screenshot bash xcompmgr neovim fusefs-ntfs drm-kmod twemoji-color-font-ttf ja-font-std zh-font-std webcamd v4l-utils v4l_compat

mkdir ~/config/backup
mv ~/.vimrc ~/config/backup/
mv ~/.bashrc ~/config/backup/
mv ~/.tmux.conf ~/config/backup/
mv ~/.xinitrc ~/config/backup/
mv ~/.xbindkeysrc ~/config/backup/
mv ~/.gitignore ~/config/backup/
mv ~/.config/nvim/init.vim ~/config/backup/

mkdir -p ~/.config/nvim
ln -s ~/config/dotfiles/neovim ~/.config/nvim/init.vim
ln -s ~/config/dotfiles/bashrc ~/.bashrc
ln -s ~/config/dotfiles/vimrc ~/.vimrc
ln -s ~/config/dotfiles/tmux.conf ~/.tmux.conf
ln -s ~/config/dotfiles/xinitrc ~/.xinitrc
ln -s ~/config/dotfiles/xbindkeysrc ~/.xbindkeysrc
ln -s ~/config/dotfiles/gitignore ~/.gitignore
ln -s ~/config/dotfiles/perltidyrc ~/.perltidyrc
ln -s ~/config/dotfiles/profile ~/.profile

ln -s /usr/local/bin/ranger ~/bin/list

git config --global core.excludesfile ~/.gitignore
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

cp ~/config/local_config.example.sh ~/config/local_config.sh
doas cp ~/config/scripts/brightness /usr/local/bin/brightness
\curl -L https://install.perlbrew.pl | bash

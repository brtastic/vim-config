#!/usr/bin/env bash

# Set up environment

sudo zypper update
sudo zypper install gmp-devel patch xf86-video-intel freetype fontconfig gcc gvim xorg-x11-devel ncurses-devel tmux feh tree ctags htop the_silver_searcher xbindkeys MozillaThunderbird file-roller stalonetray gimp ranger nomacs xbacklight make xcompmgr xinput screenshot-tool pavucontrol pulseaudio #openvpn

ln -s ~/usr/bin/ranger ~/bin/list

git worktree add system-independent


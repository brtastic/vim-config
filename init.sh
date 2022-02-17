#!/usr/bin/env sh

cp ~/config/system-independent/local_config.example.sh ~/config/local_config.sh
git config --global core.excludesfile ~/.gitignore

git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

\curl -L https://install.perlbrew.pl | bash


#!/usr/bin/env sh

mkdir ~/bin
ln -s ~/config/scripts/pstatus ~/bin/pstatus
ln -s ~/config/scripts/sched ~/bin/sched
ln -s ~/config/scripts/mon ~/bin/mon
ln -s ~/config/scripts/mnt ~/bin/mnt
ln -s ~/config/scripts/touchpadtgl ~/bin/touchpadtgl
ln -s ~/config/scripts/vi-workspace ~/bin/vi-workspace
ln -s ~/config/scripts/kbtgl ~/bin/kbtgl
ln -s ~/config/scripts/todo ~/bin/todo
ln -s ~/config/scripts/jrun ~/bin/jrun
ln -s ~/config/scripts/jroot ~/bin/jroot
ln -s ~/config/scripts/webcamstart ~/bin/webcamstart
doas cp ~/config/scripts/brightness /usr/local/bin/brightness

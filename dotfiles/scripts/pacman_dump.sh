#!/bin/bash
pacman -Qqm > /home/stoye/dotfiles/auracle.lst
pacman -Qqe | grep -v "$(pacman -Qqm)" > /home/stoye/dotfiles/pacman.lst

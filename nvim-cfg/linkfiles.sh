for i in $(cd ~/.config/nvim && find); do ln -f /home/joerg/.config/nvim/$i $i; done

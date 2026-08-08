#Aliases for ls and sl
alias ls='exa'
alias ll='exa -l'
alias sl='sl -wl'

#Shutdown and suspend
alias sd='sudo poweroff'

#Registra video dalla webcam, non deve già esistere il file
alias takevideo='ffmpeg -f v4l2 -video_size 640x480 -i /dev/video0 -f alsa -i default -c:v libx264 -preset ultrafast -c:a aac webcam.mp4'

#Bc 
alias bc='bc -ql'

# objdump syntax
alias objdump='objdump --disassembler-option=intel'

# cal with correct start
alias cal='cal -m'

# Manage dotfiles
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles.git/ --work-tree=$HOME'

/usr/bin/pipewire &
/usr/bin/pipewire-pulse &
/usr/bin/wireplumber &

setxkbmap -option "caps:swapescape" &

picom &
xrandr --output eDP-1 --off --output HDMI-1 --primary --mode 2560x1440 &
nitrogen --restore &
exec dwm
dwmblocks &

xmodmap /home/qberg/.Xmodmap


#### Display all resolution for the displays get the resolution and the rate for the next command
xrandr


####
xrandr --output HDMI-1 --mode 2560x1440 --rate 60


#### persist the setting
ll /etc/share/sddm/scripts/Xsetup
sudo nvim /etc/share/sddm/scripts/Xsetup

#### Finding out screen resolution of my Linux desktop
xdpyinfo | grep 'dimensions:'
xdpyinfo | awk '/dimensions/ {print $2}'
xrandr | grep '*'

#### Displays
xrandr --auto --output HDMI-1-2 --mode 1920x1080 --right-of eDP-1-1

#### laptop-lenovo
xrandr --auto --output HDMI-1 --mode 1920x1080 --right-of eDP-1
xrandr --auto --output HDMI-1 --mode 1920x1080 --left-of eDP-1
xrandr --auto --output HDMI-1 --mode 2560x1440 --left-of eDP-1





#### command cvt, get the modeline
cvt 2560 1440

#### result for monitor samsung
"2560x1440_60.00"  312.25  2560 2752 3024 3488  1440 1443 1448 1493 -hsync +vsync

xrandr --newmode "2560x1440_60.00"  312.25  2560 2752 3024 3488  1440 1443 1448 1493 -hsync +vsync
xrandr --addmode HDMI-1 "2560x1440_60.00"
xrandr --output HDMI-1 --mode "2560x1440_60.00"

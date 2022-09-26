
#### Displays
xrandr --auto --output HDMI-1-2 --mode 1920x1080 --right-of eDP-1-1
xrandr --auto --output HDMI-1 --mode 1920x1080 --right-of eDP-1

#### bluetooth audifonos WH-1000XM4
bluetoothctl power on
rfkill unblock all
bluetoothctl connect 14:3F:A6:09:FC:08
bluetoothctl disconnect 14:3F:A6:09:FC:08
bluetoothctl devices
bluetoothctl -h
bluetoothctl show
bluetoothctl devices
bluetoothctl list
bluetoothctl paired-devices


#### set audio volume to 100%
amixer -D pulse sset Master 100%

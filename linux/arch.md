#### arch linux




#### set keyboard rate not persistent
xset r rate 200 30


#### set keyboard persistent
docs: https://wiki.archlinux.org/title/Xorg/Keyboard_configuration

nvim /etc/X11/xorg.conf.d/00-keyboard.conf

# set Option 
Section "InputClass"
        ...
        Option "AutoRepeat" "200 30"
        ...
EndSection


#### xinput mouse
docs: https://linuxhint.com/change_mouse_touchpad_settings_xinput_linux/

xinput list
xinput --list-props "SynPS/2 Synaptics TouchPad"

xinput set-prop "SynPS/2 Synaptics TouchPad" "libinput Tapping Enabled" 1


#### xinput set touchpad persistent
# sudo mkdir -p /etc/X11/xorg.conf.d
cat /etc/X11/xorg.conf.d/99-touchpad.conf
sudo nvim /etc/X11/xorg.conf.d/99-touchpad.conf


Section "InputClass"
  Identifier "Touchpad"
  MatchProduct "SynPS/2 Synaptics TouchPad"
  Option "libinput Tapping Enabled" "1"
EndSection

### remote control
- tigervnc: https://github.com/TigerVNC/tigervnc
```
sudo pacman -Ss tigervnc
sudo pacman -S tigervnc

# set the password 
vncpasswd

# add users
sudo nvim /etc/tigervnc/vncserver.users
:1=jchinchillas

# 
la /usr/share/xsessions


# set the config
la ~/.vnc/config
cat ~/.vnc/config
nvim ~/.vnc/config

securitytypes=vncauth,tlsvnc
session=xfce
geometry=1920x1080
localhost
alwaysshared

vncserver :1
rlaplnxml1:5901
ps -ax | grep vnc
sudo kill -9 2726

man vncserver
la /etc/tigervnc
cat /etc/tigervnc/vncserver-config-defaults
cat /etc/tigervnc/vncserver-config-mandatory
cat /etc/tigervnc/vncserver.users

man vncconfig
man vncpasswd
man vncviewer
man Xvnc

systemctl start vncserver@:1
systemctl status vncserver@:1
journalctl -xeu vncserver@:1.service
cat ~/.vnc/rlaplnxml1:1.log

systemctl restart vncserver@:1
systemctl stop vncserver@:1
systemctl enable vncserver@:1
la ~/.vnc
cat rlaplnxml1:0.log
rm ~/.vnc/rlaplnxml1:0.log
rm ~/.vnc/rlaplnxml1:1.log
ip addr

192.168.100.85:1
192.168.100.85:5900
192.168.100.85:5901

rlaplnxml1:1
rlaplnxml1:5900
rlaplnxml1:5901
```

## vnc-viewer
```
brew info --cask vnc-viewer
brew install --cask vnc-viewer
```

la /lib/systemd/system/vncserver@.service
cp /lib/systemd/system/vncserver@.service /etc/systemd/system/vncserver@:1.service
```




nvim ~/.vnc/xstartup

#!/bin/sh 
[ -x /etc/vnc/xstartup ] && exec /etc/vnc/xstartup
[ -r $HOME/.Xresources ] && xrdb $HOME/.Xresources
xsetroot -solid grey -cursor_name left_ptr
xsetroot -solid grey left_ptr
vncconfig -iconic &
## Adding this 07.01.2021 because can't actually login
#exec gnome-session &
dbus-launch --exit-with-session /usr/bin/xfce4-session &


ssh -L 5901:127.0.0.1:5901 -N -f -l jchinchillas rlaplnxml1
ssh -L 5901:localhost:5901 -N -f -l jchinchillas rlaplnxml1

ps aux | grep ssh





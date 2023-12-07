## install arch linux
- docs: https://codigocristo.github.io/Instalar_ArchLinux_Ext4.html
```
nvim /Users/jchinchillas/.ssh/known_hosts
ssh root@192.168.100.4
ssh jchinchillas@192.168.100.4
ssh jchinchillas@rlaplnxml2
rlaplnxml2
ping rlaplnxml2
ping -c 3 192.168.100.4
ping -c 3 google.com

ls /sys/firmware/efi/efivars
ping -c 3 archlinux.org

echo "en_US.UTF-8 UTF-8" > /etc/locale.gen
locale-gen
cat /etc/locale.gen
nvim /etc/locale.gen

export LANG=en_US.UTF-8

pacman -Sy

timedatectl set-ntp true

# delete all partitions
fdisk -l
sgdisk --zap-all /dev/sda

archinstall

cat /etc/pacman.d/mirrorlist
pacman -Sy reflector python --noconfirm
reflector --verbose --latest 5 --sort rate --save /etc/pacman.d/mirrorlist

nvim /etc/pacman.conf
# Misc options
#UseSyslog
Color   > agrega color a la syntaxis
#NoProgressBar 
CheckSpace   > nos dice el espacio que ocupa los programas
VerbosePkgLists  > nos da una lista mas detallada de los programas
ParallelDownloads = 5  > Descargas paralelas puedes descarga 5 programas a la vez
ILoveCandy > Agrega la animación de pacman comiendo 0

git neovim neofetch wget curl gnu-free-fonts ttf-hack ttf-inconsolata noto-fonts-emoji
pacman -S gnu-free-fonts ttf-hack ttf-inconsolata noto-fonts-emoji
pacman -S neofetch wget
```

## desktop install
```
sudo pacman -S xfce4 xfce4-goodies network-manager-applet lightdm lightdm-gtk-greeter lightdm-gtk-greeter-settings light-locker accountsservice
sudo systemctl enable sshd
reboot
ping -c 3 192.168.100.4 

```

## journalctl
```
journalctl --priority=3
journalctl --priority=3 -xb
dbus-launch --sh-syntax --exit-with-session Hyprland

```

## install yay
```
sudo pacman -S --needed git base-devel
git clone https://aur.archlinux.org/yay-bin.git
cd yay-bin
makepkg -si
```

## check displays(monitors)
```
yay -S wlr-randr
paru -S wlr-randr
sudo wlr-randr
```

## hyprland
```
nvim ~/.config/hypr/hyprland.conf

# commands
hyprctl -h

## check linuxmobile dotfiles before install 
- https://github.com/linuxmobile/hyprland-dots

echo $SHELL
nvim ~/.bashrc
```


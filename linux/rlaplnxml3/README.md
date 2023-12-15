## install arch linux

- docs: https://codigocristo.github.io/Instalar_ArchLinux_Ext4.html

```
#  change password rlaplnxml3
passwd

# connect to rlaplnxml3
ssh root@192.168.100.5
ping -c 3 google.com

# check EFI o UEFI
ls /sys/firmware/efi/efivars ## if not exist is UEFI

# set keyboard layout
echo "en_US.UTF-8 UTF-8" > /etc/locale.gen
locale-gen
cat /etc/locale.gen
vim /etc/locale.gen

export LANG=en_US.UTF-8
echo $LANG

# update system
pacman -Sy

# set time
timedatectl set-ntp true

# delete all partitions
fdisk -l ## list all partitions
sgdisk --zap-all /dev/sda

# run installer
archinstall

# remove 192.168.100.5
nvim ~/.ssh/known_hosts # remove root@192.168.100.5

# connect jchinchillas
ssh-copy-id jchinchillas@rlaplnxml3
ssh jchinchillas@rlaplnxml3

# update arch
sudo pacman -Syu

# update mirrorlist
cat /etc/pacman.d/mirrorlist
sudo pacman -Sy reflector python --noconfirm
sudo reflector --verbose --latest 5 --sort rate --save /etc/pacman.d/mirrorlist
cat /etc/pacman.d/mirrorlist

# set pacman.conf
sudo nvim /etc/pacman.conf
# Misc options
#UseSyslog
Color   > agrega color a la syntaxis
#NoProgressBar
CheckSpace   > nos dice el espacio que ocupa los programas
VerbosePkgLists  > nos da una lista mas detallada de los programas
ParallelDownloads = 5  > Descargas paralelas puedes descarga 5 programas a la vez
ILoveCandy > Agrega la animación de pacman comiendo 0

# install programs
sudo pacman -S git neofetch wget curl gnu-free-fonts ttf-hack ttf-inconsolata noto-fonts-emoji
```

## install paru

```
mkdir -p ~/repos
cd ~/repos
sudo pacman -S --needed base-devel
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si

```

## install fonts with paru

```
paru -Ss nerd-fonts
paru -Ss meslo

paru -S ttf-meslo-nerd ttf-meslo-nerd-font-powerlevel10k otf-aurulent-nerd nerd-fonts-complete-mono-glyphs nerd-fonts-sf-mono ttf-nerd-fonts-hack-complete-git nerd-fonts-inter nerd-fonts-fontconfig nerd-fonts-sarasa-term nerd-fonts-cozette-ttf nerd-fonts-jetbrains-mono-160 otf-nerd-fonts-monacob-mono otf-operator-mono-nerd ttf-consolas-with-yahei-powerline-git ttf-nerd-fonts-input nerd-fonts-dm-mono nerd-fonts-sf-mono-ligatures ttf-sarasa-gothic-nerd-fonts

sudo pacman -Ss fontconfig # package with fc-cache
sudo fc-cache -f -v
fc-list | grep Nerd # list installed fonts
fc-list | grep 'MesloLGS NF' # list installed fonts
```

#### [install zsh](./zsh/README.md)

### install oh-my-zsh

- docs: https://ohmyz.sh/#install

```check again the docs
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
ls -la
```

### install powerlevel10k

- docs: https://github.com/romkatv/powerlevel10k

```check again the docs
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

### To activate this theme, add the following at the end of your .zshrc:
source /usr/local/share/powerlevel10k/powerlevel10k.zsh-theme
scp ~/.p10k.zsh jchinchillas@rlaplnxml1:~/.p10k.zsh
scp ~/.p10k.zsh jchinchillas@rlaplnxml2:~/.p10k.zsh

ls -la /usr/local/share/powerlevel10k/
nvim ~/.zshrc
source ~/.zshrc
```

### install zsh plugins

- docs:

```
  git
  zsh-autosuggestions: git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
  zsh-syntax-highlighting: git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
  sudo
  kube-ps1
```

plugins=(
git
zsh-autosuggestions
zsh-syntax-highlighting
sudo
kube-ps1
)

# install packages

```
paru -Ss ripgrep
paru -S ripgrep
```

# install fuzzy finder
```
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
```

## [install dns(bind9)](./docker_apps/dns/README.md)

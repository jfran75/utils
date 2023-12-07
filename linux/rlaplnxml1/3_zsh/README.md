#### install zsh
- docs: https://github.com/ohmyzsh/ohmyzsh/wiki/Installing-ZSH
```
sudo pacman -S zsh
zsh --version
chsh -s $(which zsh) # set default shell
echo $SHELL #check if zsh is the default shell
```

### install oh-my-zsh
- docs: https://ohmyz.sh/#install

``` check again the docs
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
ls -la
```

### install fonts
```
mkdir -p ~/.local/share/fonts/
cd ~/.local/share/fonts/
ls -la ~/.local/share/fonts/
wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf
wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf
wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf
wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf
```

## install nerd-fonts
```
yay -Ss nerd-fonts
{
  for font in $(yay -Ss nerd-fonts | grep 'AUR' | cut -d '/' -f 2 | cut -d ' ' -f 1); do
    yay -S "$font"
  done
}
fc-cache -f -v
fc-list | grep 'MesloLGS NF' # list installed fonts

```

## install paru
```
mkdir -p ~/repos
cd ~/repos
sudo pacman -S --needed base-devel git
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si

```


## install paru
```
paru -Ss nerd-fonts
{
  for font in $(paru -Ss nerd-fonts | grep 'AUR' | cut -d '/' -f 2 | cut -d ' ' -f 1); do
    paru -S "$font"
  done
}
fc-cache -f -v
fc-list | grep 'MesloLGS NF' # list installed fonts

```

### install powerlevel10k
- docs: https://github.com/romkatv/powerlevel10k

``` check again the docs
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
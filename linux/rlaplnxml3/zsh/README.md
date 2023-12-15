#### install zsh

- docs: https://github.com/ohmyzsh/ohmyzsh/wiki/Installing-ZSH

```
sudo pacman -S zsh
zsh --version
chsh -s $(which zsh) # set default shell and close the session
echo $SHELL #check if zsh is the default shell
```

### install oh-my-zsh

- docs: https://ohmyz.sh/#install

```check again the docs
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

### install fonts

```
fc-list | grep 'MesloLGS NF' # list installed fonts
mkdir -p ~/.local/share/fonts/
cd ~/.local/share/fonts/
ls -la ~/.local/share/fonts/
wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf
wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf
wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf
wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf
```

### install powerlevel10k

- docs: https://github.com/romkatv/powerlevel10k

```check again the docs
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

```

### install zsh plugins

- docs:

```
  zsh-autosuggestions:
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
  zsh-syntax-highlighting:
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```

# install zoxide

```
sudo pacman -S zoxide
```

## install nvm

```
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.5/install.sh | bash
nvim ~/.zshrc

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

source ~/.zshrc
nvm --version

nvm install v16.14

```

# copy default config

```
scp .zshrc jchinchillas@rlaplnxml3:~/.zshrc
scp .p10k.zsh jchinchillas@rlaplnxml3:~/.p10k.zsh
la ~/.zshrc
la ~/.p10k.zsh
```

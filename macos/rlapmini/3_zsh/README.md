#### install zsh
- docs: https://github.com/ohmyzsh/ohmyzsh/wiki/Installing-ZSH
```
brew info zsh
brew install zsh
zsh --version
echo $SHELL #check if zsh is the default shell
```

### install oh-my-zsh
- docs: https://ohmyz.sh/#install

``` check again the docs
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
ls -la
```

### install powerlevel10k
- docs: https://github.com/romkatv/powerlevel10k

``` check again the docs
brew info powerlevel10k
brew install powerlevel10k

### To activate this theme, add the following at the end of your .zshrc:
source /usr/local/share/powerlevel10k/powerlevel10k.zsh-theme
scp .p10k.zsh jchinchillas@rlapmini.local:~/.p10k.zsh

ls -la /usr/local/share/powerlevel10k/
nvim ~/.zshrc
source ~/.zshrc

#### install fonts
brew tap homebrew/cask-fonts
brew search '/font-.*-nerd-font/' | awk '{ print $1 }' | xargs -I{} brew install --cask {} || true

```
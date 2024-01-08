#### copy  the settings and shortcuts from rlaplapm1


#### write settings for mac
```
defaults write com.apple.screencapture type jpg
defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false
defaults write com.visualstudio.code.oss ApplePressAndHoldEnabled -bool false
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false
defaults write -g KeyRepeat -int 1
defaults write -g InitialKeyRepeat -int 14
```

#### for Dock
```
defaults write com.apple.dock static-only -bool true # keep only the opened apps
killall Dock
```

#### for Finder
```
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true
defaults write com.apple.finder _FXSortFoldersFirst -bool true
killall Finder
```

## install kitty
## install neovim
 - brew install 
 - scp -r ~/.config/nvim jchinchillas@rlaplapm1:~/.config

## install oh-my-zsh

## install fonts
  - ## install nerd-fonts
  - https://github.com/ryanoasis/nerd-fonts?tab=readme-ov-file
  ```
    brew tap homebrew/cask-fonts
    brew install font-hack-nerd-font
  ```

## install powerlevel10k/powerlevel10k

## install cisco vpn client
```
### cisco anyconnect
alias vc="/opt/cisco/anyconnect/bin/vpn -s connect Anyconnect.IT.Megacable.com.mx"
alias vd="/opt/cisco/anyconnect/bin/vpn -s disconnect Anyconnect.IT.Megacable.com.mx"
alias vs="/opt/cisco/anyconnect/bin/vpn state" 
```

## set /etc/hosts

## install edge
  - brew install --cask microsoft-edge

## install brave
  - brew install --cask brave-browser

## install chrome
  - brew install --cask google-chrome

## install kubectl
  - brew install kubernetes-cli

## install vsphere plugin
- install rosetta before: /usr/sbin/softwareupdate --install-rosetta --agree-to-license
- kubectl-vsphere need to be approved by the user Settings => Security & Privacy
```
curl -o vsphere-plugin-macos.zip -LOk https://10.10.97.129/wcp/plugin/darwin-amd64/vsphere-plugin.zip
macos move kubectl-vsphere to /usr/local/bin
ls -la /usr/local/bin
scp kubectl-vsphere jchinchilla@rlaplapm1:~/repos/kubectl-vsphere
sudo cp kubectl-vsphere /usr/local/bin

```

## install k9s
  - brew install k9s

## registar ssh key bitbucket

## install tmux
  - brew install tmux

## install nvm
  - brew install nvm
  
## install miniconda
  - brew install --cask miniconda

## install tree
  - brew install tree

## install ripgrep
  - brew install ripgrep

## install zoxide 
  - brew install zoxide

## install lsd
  - brew install lsd

## install bat
  - brew install bat

## install fzf
```
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
```

## install postman
  - brew install --cask postman

## install vscode
  - brew install --cask visual-studio-code
  - copy the settings

## install rider with jetbrains-toolbox
  - brew install --cask jetbrains-toolbox

## install docker
  - brew install --cask docker --force
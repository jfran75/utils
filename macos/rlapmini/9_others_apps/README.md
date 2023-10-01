
``` jetbrains-toolbox
brew info jetbrains-toolbox
brew install --cask jetbrains-toolbox
```

``` docker
brew info docker
brew install --cask docker
```

``` tree
brew info tree
brew install tree
```

``` tanzu config
#rm -rf ~/.kube
#rm -rf ~/.kube/cache
mkdir ~/.kube
scp -r ~/.kube jchinchillas@rlapmini.local:~/
tree ~/.kube
ls -la ~/.kube
```

``` kubectl
brew info kubectl
brew install kubectl

scp /usr/local/bin/kubectl-vsphere jchinchillas@rlapmini.local:~/paso
ls -la ~/paso
sudo mv ~/paso/kubectl-vsphere /usr/local/bin
ls -la /usr/local/bin/kubectl-vsphere
kubectl plugin list
```

``` krew
brew info krew
brew install krew
```

``` krew plugins kubectl-neat 
kubectl krew install neat
kubectl krew uninstall neat
```

``` k9s
brew info k9s
brew install k9s
```

``` openlens
brew info openlens
brew install --cask openlens
```

``` helm
brew info helm
brew install helm
```

``` cleanmymac
brew info cleanmymac
brew install --cask cleanmymac
```

``` nvm
brew info nvm
brew install nvm
mkdir ~/.nvm
```

``` fzf
brew info fzf
brew install fzf
```

``` ripgrep
brew info ripgrep
brew install ripgrep
```

``` bat
brew info bat
brew install bat
```

``` fd
brew info fd
brew install fd
```

``` zoxide
brew info zoxide
brew install zoxide
```

``` jq
brew info jq
brew install jq
```

``` edge
brew info microsoft-edge
brew install --cask microsoft-edge
```

``` brave
brew info brave-browser
brew install --cask brave-browser
```

``` chrome
brew info google-chrome
brew install --cask google-chrome
```

``` postman
brew info postman
brew install --cask postman
```
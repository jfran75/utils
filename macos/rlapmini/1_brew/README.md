#### brew commands
```
brew search emacs
brew update 
brew outdated # list packages that need to be upgraded
brew upgrade # upgrade all packages that need to be upgraded
brew install {package}
brew install --cask {package}
brew uninstall {package}
brew list=
```

#### homebrew dump
```
brew bundle dump # generate a Brewfile

# edit the generated file, add new packages
nvim Brewfile

# after edit the file run the next command for install all changes
brew bundle
```

#### packages to check
```
https://github.com/magic-wormhole/magic-wormhole # for transfer files(safety)

```
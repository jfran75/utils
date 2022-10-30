#### copy  the settings and shortcuts from rlapmini


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
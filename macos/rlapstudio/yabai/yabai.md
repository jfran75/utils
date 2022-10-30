#### install yabai
https://github.com/koekeishiya/yabai
https://github.com/koekeishiya/skhd
https://spacelauncherapp.com/
https://dotfiles.joshmedeski.com/yabai.html#skhdrc
```
brew install koekeishiya/formulae/yabai
brew install skhd

mkdir $HOME/.config/yabai
mkdir $HOME/.config/skhd

cp yabairc $HOME/.config/yabai/yabairc
cp skhdrc $HOME/.config/skhd/skhdrc

chmod +x $HOME/.config/yabai/yabairc

ll $HOME/.config/yabai/yabairc
ll $HOME/.config/skhd/skhdrc

brew services start yabai
brew services start skhd

cp yabairc $HOME/.config/yabai/yabairc
brew services restart yabai
brew services restart skhd

brew services list

echo $HOMEBREW_PREFIX

ll $HOMEBREW_PREFIX/var/log/yabai/
tail -f $HOMEBREW_PREFIX/var/log/yabai/yabai.err.log
tail -f $HOMEBREW_PREFIX/var/log/yabai/yabai.out.log

```

{  
  brew services restart yabai
  brew services restart skhd
}


chmod +x moveWindowLeftAndFollowFocus.sh
chmod +x moveWindowRightAndFollowFocus.sh
chmod +x switchAndFocusSIP.sh
chmod +x window-focus-on-destroy.sh

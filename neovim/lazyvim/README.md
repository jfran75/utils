#### test lazyvim
- docs:
  - https://www.lazyvim.org/
  - https://github.com/LazyVim/lazyvi

#### required
mv ~/.config/nvim ~/.config/nvim.bak

#### optional but recommended
mv ~/.local/share/nvim ~/.local/share/nvim.bak
mv ~/.local/state/nvim ~/.local/state/nvim.bak
mv ~/.cache/nvim ~/.cache/nvim.bak

#### remove nvim
{
  rm -rf ~/.local/share/nvim
  rm -rf ~/.local/state/nvim
  rm -rf ~/.cache/nvim
  rm -rf ~/.config/nvim
}


{
  mkdir -p ~/.config/nvim
  touch ~/.config/nvim/init.lua
}
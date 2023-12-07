#### audio

```
ssh jchinchillas@rlaplnxml2

sudo pacman -S pipewire pipewire-pulse pavucontrol
which pipewire
which pipewire-pulse
which pavucontrol

# edit hyperland and run once
nvim ~/.config/hypr/hyprland.conf
exec-once = pipewire & pipewire-pulse
```

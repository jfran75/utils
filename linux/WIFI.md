## enable wifi arch linux
```
ssh jchinchillas@rlaplnxml3
sudo systemctl enable NetworkManager
sudo systemctl start NetworkManager

# chec wifi interface
- commands
  - ip link
  - lspci -k
  - lspci | grep -i wireless
  
wlp3s0

```
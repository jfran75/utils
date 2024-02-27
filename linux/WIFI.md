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
  
sudo systemctl status systemd-networkd
sudo systemctl status systemd-resolved

sudo systemctl stop systemd-networkd
sudo systemctl stop systemd-resolved

# install networkmanager
sudo pacman -S networkmanager
sudo systemctl status NetworkManager
sudo systemctl start NetworkManager
sudo systemctl enable NetworkManager

nmcli device wifi list
# connect to hide wifi


nmcli device wifi connect -h
nmcli device wifi connect shinshinet password simona.755
sudo nmcli device wifi connect shinshinet24 password simona.755
sudo nmcli device wifi connect shinshinet --ask
sudo nmcli device wifi connect shinshinet password simona.755

cat /etc/systemd/network/20-wlan.network

sudo nmcli c add type wifi con-name shinshinet ifname wlp3s0 ssid shinshinet
sudo nmcli con modify shinshinet wifi-sec.key-mgmt wpa-psk
sudo nmcli con modify shinshinet wifi-sec.psk ptclptcl
sudo nmcli con up shinshinet
sudo nmcli con delete shinshinet

sudo nmcli c add type wifi con-name shinshinet24 ifname wlp3s0 ssid shinshinet24
sudo nmcli con modify shinshinet24 wifi-sec.key-mgmt wpa-psk
sudo nmcli con modify shinshinet24 wifi-sec.psk ptclptcl
sudo nmcli con up shinshinet24 --ask
sudo nmcli con delete shinshinet24
sudo nmcli dev wifi connect "shinshinet24" password "simona.755" hidden yes

dhcpcd -h
sudo pacman -S dhcpcd

sudo dhcpcd wlp3s0

```
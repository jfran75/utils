## install thinlinc-server archlinux
```
yay -G thinlinc-server
cd thinlinc-server

Se modifico el paquete PKGBUILD se eliminaron servicios que no ocupaba
Entonces solo necesitas copiarlo a la nueva maquina
scp PKGBUILD jchinchillas@rlaplnxml1:~/repos/thinlinc-server/PKGBUILD
# Ya lo modifique wget https://img.vidalinux.com/files/thinlinc-server-url.patch --no-check-certificate 

ejecuta varias veces
makepkg -si

despues de instalar ejecutar /opt/thinlinc/sbin/tl-setup


sudo systemctl start tlwebaccess.service
sudo systemctl status tlwebaccess.service
journalctl -xeu tlwebaccess.service

sudo systemctl start tlwebadm.service
sudo systemctl status tlwebadm.service
journalctl -xeu tlwebadm.service


https://192.168.100.85:1010/status/sessions

sudo pacman -R thinlinc-server

```

## install thinlinc-client macos
```
brew install --cask thinlinc-client
```

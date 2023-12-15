## install docker engine

```
ping rlaplnxml3
ssh jchinchillas@rlaplnxml3

sudo pacman -S docker
sudo docker version
sudo systemctl start docker.service
sudo systemctl stop docker.service
sudo systemctl status docker.service
sudo systemctl enable docker.service
echo $USER
sudo usermod -aG docker $USER

sudo nvim /etc/docker/daemon.json
{
  "memory": "2G"
}

journalctl -xeu docker.service
sudo reboot now

```

### install docker-compose

```
sudo pacman -Ss docker-compose
sudo pacman -S docker-compose
docker compose version
```

## base images

ping registry.sfycnextgen.com.mx
docker login registry.sfycnextgen.com.mx
docker pull registry.sfycnextgen.com.mx/bases/base-node:16.14.10-alpine

sudo ls /etc/default/grub
sudo ls -la /boot/efi

sudo ls -la /boot/EFI/systemd/systemd-bootx64.efi
sudo ls -la /boot/EFI/BOOT/BOOTX64.EFI

grub-install -h
grub-install --target=x86_64-efi --efi-directory=/dev/sda1 --bootloader-id=grub

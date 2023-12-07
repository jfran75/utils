## install docker engine
```
ping rlaplnxml1
ssh jchinchillas@rlaplnxml1

sudo pacman -S docker
sudo docker version
sudo systemctl start docker.service
sudo systemctl stop docker.service
sudo systemctl status docker.service 
sudo systemctl enable docker.service
sudo usermod -aG docker $USER

sudo nvim /etc/docker/daemon.json
{
  "memory": "2G"
}

journalctl -xeu docker.service
sudo reboot

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

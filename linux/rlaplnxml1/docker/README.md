## install docker engine
```
sudo pacman -S docker
sudo docker version
sudo systemctl start docker.service
sudo systemctl status docker.service 
sudo systemctl enable docker.service
sudo usermod -aG docker $USER
```
## install kasm
```
ssh jchinchillas@rlaplnxml2

# must have hostname command
sudo pacman -Ss inetutils
sudo pacman -S inetutils
hostname

cd /tmp
curl -O https://kasm-static-content.s3.amazonaws.com/kasm_release_1.15.0.06fdc8.tar.gz
tar -xf kasm_release_1.15.0.06fdc8.tar.gz
sudo bash kasm_release/install.sh

ls -lart kasm_release
nvim kasm_release/install_dependencies.sh

## navigate
https://rlaplnxml2

ping jenkins.dev-cluster.sfycnextgen.com.mx

https://jenkins.dev-cluster.sfycnextgen.com.mx/
```


## setting network
```
la /etc/systemd/
## resolved
sudo mkdir /etc/systemd/resolved.conf.d
la /etc/systemd/resolved.conf.d

sudo nvim /etc/systemd/resolved.conf.d/resolv.conf
  - set: 
  [Resolve]
  DNS=192.168.100.5

cat /etc/systemd/resolved.conf.d/resolv.conf

## network
cat /etc/systemd/networkd.conf

sudo mkdir /etc/systemd/networkd.conf.d/
sudo cp /etc/systemd/networkd.conf /etc/systemd/networkd.conf.d/20-wired.network
sudo nvim /etc/systemd/networkd.conf.d/20-wired.network
set 
  [DHCP]
  UseDNS=false

sudo systemctl restart systemd-networkd
systemctl restart systemd-resolved

## test
ping rlaplnxml2.home
ping rlapstudio.home

```

## setting persistent
```
# create into the host
sudo mkdir -p /data/shares/accounting
sudo mkdir -p /data/profiles

la /data/shares/accounting
la /data/profiles
cat /etc/passwd | grep jchinchillas

sudo chown -R jchinchillas:jchinchillas /data
ls -lart /data/profiles

{
  "/data/shares/accounting": {
    "bind": "/shares/accounting",
    "mode": "rw",
    "uid": 1000,
    "gid": 1000,
    "required": false
  }
}

```


curl -k https://rlaplnxml2.home/api/__healthcheck


# restart all services on a server
cd /opt/kasm/bin
ls -lart
sudo ./stop
sudo ./start


kasm Error after container creation Traceback (most recent call last):
  File "provision.py", line 1939, in provision
  File "provision.py", line 2136, in generate_nginx_config
Exception: Nginx failed to reload after generating config for container (1af2f50c167aaa941b02a051281137fde6ddfec4bec4b276c55dc7f303f3c4d3)
Traceback (most recent call last):
  File "provision.py", line 1939, in provision
  File "provision.py", line 2136, in generate_nginx_config
Exception: Nginx failed to reload after generating config for container (1af2f50c167aaa941b02a051281137fde6ddfec4bec4b276c55dc7f303f3c4d3)

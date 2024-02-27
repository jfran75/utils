## dns bind9
```
ls -lart /etc/systemd/resolved.conf
sudo nvim /etc/systemd/resolved.conf
 - set DNSStubListener=no
sudo systemctl restart systemd-resolved

http://192.168.100.1/index.asp

docker compose up

```

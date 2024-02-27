## dns bind9
```
ls -lart /etc/systemd/resolved.conf
sudo nvim /etc/systemd/resolved.conf
 - set DNSStubListener=no
sudo systemctl restart systemd-resolved
docker compose up

nslookup youtube.com 192.168.100.5

http://192.168.100.1/index.asp
```

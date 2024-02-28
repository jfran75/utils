## dns bind9
```
ls -lart /etc/systemd/resolved.conf
sudo nvim /etc/systemd/resolved.conf
 - set DNSStubListener=no
sudo systemctl restart systemd-resolved
docker compose up


nslookup google.com 192.168.100.5
nslookup home 192.168.100.5

nslookup rlapmini.home 192.168.100.5
nslookup rlapstudio.home 192.168.100.5
nslookup rlaplenovo.home 192.168.100.5
nslookup rlaplnxml1.home 192.168.100.5
nslookup rlaplnxml2.home 192.168.100.5
nslookup rlaplnxml3.home 192.168.100.5
nslookup rlaplapm1.home 192.168.100.5

sudo rm -rf cache && sudo rm -rf records && docker compose up
rm -rf cache && rm -rf records && docker compose up

nslookup youtube.com 192.168.100.5
dig @192.168.100.5 youtube.com

nslookup youtube.com
nslookup youtube.com 192.168.100.23

```
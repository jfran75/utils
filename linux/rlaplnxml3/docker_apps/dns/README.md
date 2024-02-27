## dns bind9
```
ls -lart /etc/systemd/resolved.conf
sudo nvim /etc/systemd/resolved.conf
 - set DNSStubListener=no
sudo systemctl restart systemd-resolved
docker compose up

nslookup youtube.com 192.168.100.5
sudo vim /etc/resolv.conf

http://192.168.100.1/index.asp


rlapmini.local          IN    A   192.168.100.80
rlapstudio.local        IN    A   192.168.100.68
rlaplenovo.local        IN    A   192.168.100.64
rlaplnxml1              IN    A   192.168.100.85
rlaplnxml2              IN    A   192.168.100.4 
rlaplnxml3              IN    A   192.168.100.5 
rlaplapm1.local         IN    A   192.168.100.92

rlapmini          IN    A   192.168.100.80
rlapstudio        IN    A   192.168.100.68
rlaplenovo        IN    A   192.168.100.64
rlaplnxml1        IN    A   192.168.100.85
rlaplnxml2        IN    A   192.168.100.4 
rlaplnxml3        IN    A   192.168.100.5 
rlaplapm1         IN    A   192.168.100.92

nslookup youtube.com
nslookup youtube.com 192.168.100.23


nslookup rlaplnxml2 192.168.100.5
nslookup rlaplnxml2 192.168.100.5

ping rlaplnxml2
ping rlaplnxml2.demo.shinshinet.mx
ping demo.shinshinet.mx.rlaplnxml2

bind9 failed: no owner
```

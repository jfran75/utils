## install vpn mega
```
ssh jchinchillas@rlaplnxml1 
ls -la /opt
ls -la /opt/cisco
ls -la /opt/cisco/anyconnect
ls -la /opt/cisco/anyconnect/bin

sudo rm -rf /opt/.cisco
sudo rm -rf /opt/cisco


ls -la ~/repos
ls -la ~/repos/anyconnect-linux64-4.10.05095
ls -la ~/repos/anyconnect-linux64-4.10.05095/vpn
cd ~/repos/anyconnect-linux64-4.10.05095/vpn
sudo ./vpn_install.sh
sudo ./vpn_uninstall.sh

cat /opt/cisco/anyconnect/bin/manifesttool_vpn

ls -la ~/repos/anyconnect-linux64-4.10.05095/vpn/
scp ~/Downloads/anyconnect-linux64-4.10.05095-predeploy-k9.tar.gz jchinchillas@rlaplnxml1:~/repos
scp ~/Downloads/anyconnect-linux64-4.10.05095-predeploy-deb-k9.tar.gz jchinchillas@rlaplnxml1:~/repos
cd ~/repos/anyconnect-linux64-4.10.05095/vpn/
tar -xvf anyconnect-linux64-4.10.05095-predeploy-k9.tar.gz
tar -xvf anyconnect-linux64-4.10.05095-predeploy-deb-k9.tar.gz
tar -xvf anyconnect-linux64-4.10.05095-predeploy-deb-k9.tar.gz

sudo ./vpn_install.sh
```

ls -la /opt/cisco/anyconnect
cat /opt/cisco/anyconnect/update.txt
cat /opt/cisco/anyconnect/AnyConnectLocalPolicy.xml


ls -la /opt/cisco/anyconnect/profile
cat /opt/cisco/anyconnect/profile/VPN-Megacable.xml

/opt/cisco/anyconnect/bin/vpn -s connect Anyconnect.IT.Megacable.com.mx

```
## install vpn mega
```
ssh jchinchillas@rlapmini.local
ls -la ~/repos
ls -la ~/repos/anyconnect-linux64-4.10.05095/vpn/
scp ~/Downloads/anyconnect-linux64-4.10.05095-predeploy-k9.tar.gz jchinchillas@rlapmini.local:~/repos
cd ~/repos
tar -xvf anyconnect-linux64-4.10.05095-predeploy-k9.tar.gz
cd ~/repos/anyconnect-linux64-4.10.05095/vpn/
sudo ./vpn_install.sh
```

ls -la /opt
ls -la /opt/cisco
ls -la /opt/cisco/anyconnect
ls -la /opt/cisco/anyconnect/bin

cat /opt/cisco/anyconnect/update.txt
cat /opt/cisco/anyconnect/AnyConnectLocalPolicy.xml

ls -la /opt/cisco/anyconnect/profile
cat /opt/cisco/anyconnect/profile/VPN-Megacable.xml

/opt/cisco/anyconnect/bin/vpn -s connect Anyconnect.IT.Megacable.com.mx

ls -la /opt
sudo rm -rf /opt/.cisco
sudo rm -rf /opt/cisco

scp -r /opt/cisco jchinchillas@rlapmini.local:~/repos
ls -la ~/repos/cisco
sudo mv ~/repos/cisco /opt


scp ~/Downloads/anyconnect-macos-4.10.02086-predeploy-k9.dmg jchinchillas@rlapmini.local:~/repos
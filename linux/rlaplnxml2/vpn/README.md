## install vpn mega
```
ssh jchinchillas@rlaplnxml2
ls -la /opt
ls -la /opt/cisco
ls -la /opt/cisco/anyconnect
ls -la /opt/cisco/anyconnect/bin

sudo rm -rf /opt/.cisco
sudo rm -rf /opt/cisco
sudo reboot now

ls -la /opt/.cisco/certificates/ca

ls -la ~/repos
ls -la ~/repos/vpn_mega/vpn_mega/anyconnect-linux64-4.10.05095
ls -la ~/repos/vpn_mega/anyconnect-linux64-4.10.05095/vpn
cd ~/repos/vpn_mega/anyconnect-linux64-4.10.05095/vpn
sudo ./vpn_install.sh
sudo ./vpn_uninstall.sh

ls -la ~/repos/vpn_mega/anyconnect-linux64-4.10.05095/vpn/
scp ~/Downloads/anyconnect-linux64-4.10.05095-predeploy-k9.tar.gz jchinchillas@rlaplnxml2:~/repos/vpn_mega
scp ~/Downloads/anyconnect-linux64-4.10.05095-predeploy-deb-k9.tar.gz jchinchillas@rlaplnxml2:~/repos/vpn_mega
cd ~/repos/vpn_mega
la ~/repos/vpn_mega
# rm -rf anyconnect-linux64-4.10.05095
tar -xvf anyconnect-linux64-4.10.05095-predeploy-k9.tar.gz
tar -xvf anyconnect-linux64-4.10.05095-predeploy-deb-k9.tar.gz

sudo ./vpn_install.sh

ls -la /opt/cisco/anyconnect
cat /opt/cisco/anyconnect/update.txt
cat /opt/cisco/anyconnect/AnyConnectLocalPolicy.xml


ls -la /opt/cisco/anyconnect/profile
cat /opt/cisco/anyconnect/profile/VPN-Megacable.xml
cat /opt/cisco/anyconnect/profile/AnyConnectProfile.xsd
scp /opt/cisco/anyconnect/profile/VPN-Megacable.xml jchinchillas@rlaplnxml2:~/repos/vpn_mega
cp ~/repos/vpn_mega/VPN-Megacable.xml /opt/cisco/anyconnect/profile/VPN-Megacable.xml
rm /opt/cisco/anyconnect/profile/VPN-Megacable.xml

systemctl status vpnagentd.service
systemctl start vpnagentd.service
systemctl restart vpnagentd.service
journalctl -xeu vpnagentd.service

ping Anyconnect.IT.Megacable.com.mx
/opt/cisco/anyconnect/bin/vpn -s connect Anyconnect.IT.Megacable.com.mx

```

## install vsphere plugin
```
# navigate with the browser
https://10.10.97.129

# download the plugin
curl -o vsphere-plugin-linux-amd64.zip -LOk https://10.10.97.129/wcp/plugin/linux-amd64/vsphere-plugin.zip
curl -o vsphere-plugin-macos.zip -LOk https://10.10.97.129/wcp/plugin/darwin-amd64/vsphere-plugin.zip
curl -o vsphere-plugin-windows.zip -LOk https://10.10.97.129/wcp/plugin/windows-amd64/vsphere-plugin.zip

unzip vsphere-plugin.zip
mv -v bin/* /usr/local/bin/
```

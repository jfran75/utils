#### cisco vpn
tree -la /opt/cisco/
ls -la /opt/cisco/anyconnect/bin/vpn


mkdir ~/paso/cisco
scp -r /opt/cisco jchinchillas@rlapmini.local:~/paso/cisco

ls -la ~/paso/cisco

mv /Users/jchinchillas/paso/cisco/cisco /opt/cisco
mv /opt/cisco/cisco/* /opt/cisco

mkdir /opt/cisco
ls -la /opt
ls -la /opt/cisco


sudo rm -rf /opt/cisco



#rm -rf ~/paso/cisco
ls -la ~/paso
scp -r ~/Downloads/cisco jchinchillas@rlapmini.local:~/paso
sudo mv /Users/jchinchillas/paso/cisco /opt
ls -la /opt
ls -la /opt/cisco
sudo chown -R "$USER" /opt/cisco
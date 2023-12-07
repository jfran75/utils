#### disable ipv6 arch linux
la /etc/sysctl.d/
cp 40-ipv6.conf /etc/sysctl.d/
sudo nvim /etc/sysctl.d/40-ipv6.conf

#### disable ipv6 arch linux

# list ipv6 status

sudo sysctl net.ipv6.conf | grep disable_ipv6

la /etc/sysctl.d/
cp 40-ipv6.conf /etc/sysctl.d/
sudo nvim /etc/sysctl.d/40-ipv6.conf # set the ipv6 disable to the list of interfaces

sudo systemctl restart systemd-sysctl.service
sudo systemctl status systemd-sysctl.service
sudo nvim /etc/hosts

# Testing

ping -6 www.google.com # not work
ping -c 4 -4 www.google.com # work

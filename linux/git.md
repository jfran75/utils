#### setting git

git config --global user.name "Jesus Chinchillas"
git config --global user.email "jesus.chinchillas@megacable.com.mx"
git config --global core.editor nvim
git config --list

#### generate a key
ssh-keygen -f ~/.ssh/bitbucket_mega_id_rsa
cat ~/.ssh/bitbucket_mega_id_rsa_pub | xclip -selection c

chmod 600 ~/.ssh/config
chmod 400 ~/.ssh/bitbucket_mega_id_rsa

#### disable ipv6
sysctl -w net.ipv6.conf.all.disable_ipv6=1
sysctl -w net.ipv6.conf.default.disable_ipv6=1

#### set git for bitbucket megacable
cat ~/.ssh/config
nvim ~/.ssh/config

Host bitbucket.org
    HostName altssh.bitbucket.org
    Port 443
    HostkeyAlias bitbucket.org


#### check connections
ssh -v git@bitbucket.org
ssh -v hg@bitbucket.org



## install kasm
```
ssh jchinchillas@rlaplnxml2

# must have hostname command
sudo pacman -Ss inetutils
sudo pacman -S inetutils
hostname

cd /tmp
curl -O https://kasm-static-content.s3.amazonaws.com/kasm_release_1.15.0.06fdc8.tar.gz
tar -xf kasm_release_1.15.0.06fdc8.tar.gz
sudo bash kasm_release/install.sh

ls -lart kasm_release
nvim kasm_release/install_dependencies.sh

## navigate
https://rlaplnxml2

ping jenkins.dev-cluster.sfycnextgen.com.mx

https://jenkins.dev-cluster.sfycnextgen.com.mx/
```

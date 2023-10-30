## install kubectl
```
sudo pacman -Ss kubectl
sudo pacman -S kubectl
kubectl version
which kubectl
```

## vsphere plugin
```
ls -la /usr/local/bin
sudo mv ~/paso/kubectl-vsphere /usr/local/bin
sudo rm /usr/local/bin/kubectl-vsphere

download from(docs): https://docs.vmware.com/en/VMware-vSphere/8.0/vsphere-with-tanzu-tkg/GUID-8699B9DE-01D9-4B2A-BBFB-EB1D81878587.html#install-the-kubernetes-cli-tools-for-vsphere-from-the-command-line-3

scp /Downloads/vsphere-plugin.zip jchinchillas@rlaplnxml1:~/paso
unzip vsphere-plugin.zip
kubectl plugin list

```
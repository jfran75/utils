# vagrant info
- [vagrant](https://www.vagrantup.com/docs)
- [vagrant boxes](https://app.vagrantup.com/boxes/search)
- [vagrant boxes](https://app.vagrantup.com/boxes/search?provider=hyperv)

## kill vagrant processes
Get-Process -Name ruby | Stop-Process
Get-Process -Name vagrant | Stop-Process

## vagrant environment vars
### disable symlinks and smb
# [System.Environment]::SetEnvironmentVariable("VAGRANT_DISABLE_SMBMFSYMLINKS", "1")
[System.Environment]::SetEnvironmentVariable("VAGRANT_SMB_USERNAME", "Administrador")
[System.Environment]::SetEnvironmentVariable("VAGRANT_SMB_PASSWORD", "")

# [System.Environment]::GetEnvironmentVariable("VAGRANT_DISABLE_SMBMFSYMLINKS")
[System.Environment]::GetEnvironmentVariable("VAGRANT_SMB_USERNAME")
[System.Environment]::GetEnvironmentVariable("VAGRANT_SMB_PASSWORD")

## vagrant commands
ping 192.168.100.87
ssh Administrador@192.168.100.87

cd c:\repos\redis_labs
vagrant ssh -- -v
vagrant ssh redis1
cat /etc/os-release
sudo apt-get update
sudo apt-get install linux-tools-3.11.0-15-generic
vagrant reload --provision
vagrant up -h

vagrant up
vagrant up --parallel

vagrant destroy -h
vagrant destroy -f
vagrant --help
vagrant box --help
vagrant box list
vagrant box add generic/ubuntu2004
vagrant box add bento/ubuntu-20.04

cd C:\Users\Administrador\AppData\Local\Packages\CanonicalGroupLimited.UbuntuonWindows_79rhkp1fndgsc\LocalState\rootfs
cd C:\Users\Administrador\AppData\Local\Packages\CanonicalGroupLimited.UbuntuonWindows_79rhkp1fndgsc\LocalState\rootfs\home\jchinchillas\repos\redis_labs

sudo apt-get install linux-tools-3.11.0-15-generic
sudo apt-get install hv-kvcdp-daemon-init
sudo cp /usr/lib/linux-tools/3.11.0-15/hv_* /usr/sbin/


## vagrant commands
Common commands:
     autocomplete    manages autocomplete installation on host
     box             manages boxes: installation, removal, etc.
     cloud           manages everything related to Vagrant Cloud
     destroy         stops and deletes all traces of the vagrant machine
     global-status   outputs status Vagrant environments for this user
     halt            stops the vagrant machine
     help            shows the help for a subcommand
     init            initializes a new Vagrant environment by creating a Vagrantfile
     login
     package         packages a running vagrant environment into a box
     plugin          manages plugins: install, uninstall, update, etc.
     port            displays information about guest port mappings
     powershell      connects to machine via powershell remoting
     provision       provisions the vagrant machine
     push            deploys code in this environment to a configured destination
     rdp             connects to machine via RDP
     reload          restarts vagrant machine, loads new Vagrantfile configuration
     resume          resume a suspended vagrant machine
     serve           start Vagrant server
     snapshot        manages snapshots: saving, restoring, etc.
     ssh             connects to machine via SSH
     ssh-config      outputs OpenSSH valid configuration to connect to the machine
     status          outputs status of the vagrant machine
     suspend         suspends the machine
     up              starts and provisions the vagrant environment
     upload          upload to machine via communicator
     validate        validates the Vagrantfile
     version         prints current and latest Vagrant version
     winrm           executes commands on a machine via WinRM
     winrm-config    outputs WinRM configuration to connect to the machine


Preparing SMB shared folders
vagrant You will be asked for the username and password to use for the SMB
folders shortly. Please use the proper username/password of your
account.


## windows server 2019

### install wsdl
- docs: https://learn.microsoft.com/en-us/windows/wsl/install-on-server
```
Invoke-WebRequest -Uri https://aka.ms/wslubuntu2004 -OutFile Ubuntu.appx -UseBasicParsing
Rename-Item .\Ubuntu.appx .\Ubuntu.zip
mkdir C:\Users\Administrador\wsdl
Expand-Archive .\Ubuntu.zip .\Ubuntu
Expand-Archive .\Ubuntu.zip C:\Users\Administrador\wsdl\Ubuntu
Add-AppxPackage .\Ubuntu_2004.2021.825.0_x64.appx

$userenv = [System.Environment]::GetEnvironmentVariable("Path", "User")
[System.Environment]::SetEnvironmentVariable("PATH", $userenv + ";C:\Users\Administrador\wsdl\Ubuntu", "User")
$env:userenv
```

### install vagrant ubuntu wsdl
- [example](https://www.youtube.com/watch?v=7Di0twyxw1M&list=PLXQKvxrITy47sPRHTOlBnB_Czp6EkW1Rn&index=2)
```
wget -O- https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt update && sudo apt install vagrant

export VAGRANT_WSL_WINDOWS_ACCESS_USER_HOME_PATH=/mnt/c/Users/Administrador
export VAGRANT_WSL_ENABLE_WINDOWS_ACCESS=1
export VAGRANT_DEFAULT_PROVIDER=hyperv

echo $VAGRANT_WSL_WINDOWS_ACCESS_USER_HOME_PATH
echo $VAGRANT_WSL_ENABLE_WINDOWS_ACCESS
echo $VAGRANT_DEFAULT_PROVIDER

ssh -t Administrador@192.168.3.36 "wsl ~"
```

### install ansible ubuntu wsdl
```
python3 -m pip install --user ansible
python3 -m pip uninstall --user ansible
/home/jchinchillas/.local/bin
echo $PATH | grep .local
cd ~/repos/

cd /mnt/c/repos/redis_labs
scp ./example1/Vagrantfile Administrador@192.168.100.87:C:\Users\Administrador\AppData\Local\Packages\CanonicalGroupLimited.UbuntuonWindows_79rhkp1fndgsc\LocalState\rootfs\home\jchinchillas\repos\redis_labs\Vagrantfile
scp ./example1/playbook.yml Administrador@192.168.100.87:C:\Users\Administrador\AppData\Local\Packages\CanonicalGroupLimited.UbuntuonWindows_79rhkp1fndgsc\LocalState\rootfs\home\jchinchillas\repos\redis_labs\playbook.yml

cp /mnt/c/repos/redis_labs/Vagrantfile ~/repos/redis_labs/Vagrantfile
cp /mnt/c/repos/redis_labs/playbook.yml ~/repos/redis_labs/playbook.yml

ansible-galaxy role install juju4.ipv6

scp jchinchillas@192.168.100.4:/home/jchinchillas/proyectos/rlap/utils/redis/vagrant_examples/example1/Vagrantfile .
scp jchinchillas@192.168.100.4:/home/jchinchillas/proyectos/rlap/utils/redis/vagrant_examples/example1/playbook.yml .
{
scp jchinchillas@192.168.100.4:/home/jchinchillas/proyectos/rlap/utils/redis/vagrant_examples/example1/main.yml .
scp jchinchillas@192.168.100.4:/home/jchinchillas/proyectos/rlap/utils/redis/vagrant_examples/example1/ipv6-disable.yml .
scp jchinchillas@192.168.100.4:/home/jchinchillas/proyectos/rlap/utils/redis/vagrant_examples/example1/ipv6-grub-disable.yml .
scp jchinchillas@192.168.100.4:/home/jchinchillas/proyectos/rlap/utils/redis/vagrant_examples/example1/ipv6-harden.yml .
scp jchinchillas@192.168.100.4:/home/jchinchillas/proyectos/rlap/utils/redis/vagrant_examples/example1/windows-ipv6.yml .
}
```

ansible [core 2.13.13]
  config file = None
  configured module search path = ['/home/jchinchillas/.ansible/plugins/modules', '/usr/share/ansible/plugins/modules']
  ansible python module location = /home/jchinchillas/.local/lib/python3.8/site-packages/ansible
  ansible collection location = /home/jchinchillas/.ansible/collections:/usr/share/ansible/collections
  executable location = /home/jchinchillas/.local/bin/ansible
  python version = 3.8.10 (default, Nov 22 2023, 10:22:35) [GCC 9.4.0]
  jinja version = 3.1.4
  libyaml = True
# install redis on premises
- docs:
  - [redis cluster docs](https://redis.io/docs/latest/operate/oss_and_stack/management/scaling/)
  - [github](https://github.com/redis/redis)
  - [example setting redis cluster](https://success.outsystems.com/documentation/how_to_guides/infrastructure/configuring_outsystems_with_redis_in_memory_session_storage/set_up_a_redis_cluster_for_production_environments/)  
  - [example setting redis cluster](https://www.youtube.com/watch?v=ZulHGH4io5E)

## redis ui
  - [redisinsight](https://hub.docker.com/r/redislabs/redisinsight)
    - docker pull redislabs/redisinsight
    - [example docker compose]https://www.youtube.com/watch?v=qucL1F2YEKE

## Redis Sentinel
```
Monitor the state of your Redis Cluster with a set of independent processes.
Manual failover required if you need to promote a replica in another data ce`nter to master.
```

## test redis cluster with ansible and vagrant
- vagrant examples
  - https://github.com/madhur/redis-cluster-vagrant
  - https://www.devopsroles.com/vagrant-install-redis-server/

# enable ssh windows server 2019
Add-WindowsCapability -Online -Name OpenSSH.Server~~~~0.0.1.0
Set-Service -Name ssh-agent -StartupType 'Automatic'
Set-Service -Name sshd -StartupType 'Automatic'
Get-Service ssh* | Start-Service
ssh-copy-id administrador@192.168.100.87
ssh administrador@192.168.100.87

## download and check debian

wget https://debian.osuosl.org/debian-cdimage/12.5.0/amd64/iso-dvd/debian-12.5.0-amd64-DVD-1.iso -O debian-12.5.0-amd64-DVD-1.iso
wget https://debian.osuosl.org/debian-cdimage/12.5.0/amd64/iso-dvd/SHA512SUMS -O SHA512SUMS
wget https://debian.osuosl.org/debian-cdimage/12.5.0/amd64/iso-dvd/SHA512SUMS.sign -O SHA512SUMS.sign

# check the iso sha512sum
sha512sum -c SHA512SUMS

scp debian-12.5.0-amd64-DVD-1.iso administrador@192.168.100.87:C:\hyperv-data\isos\debian\debian-12.5.0-amd64-DVD-1.iso
Mazda.7506

scp debian-12.5.0-amd64-DVD-1.iso administrador@192.168.100.87:~/C:\hyperv-data\isos
scp jchinchillas@192.168.100.4:~/proyectos/rlap/utils/redis/isos/debian-12.5.0-amd64-DVD-1.iso .
```

4096

## install vagrant windows server

wget https://releases.hashicorp.com/vagrant/2.4.1/vagrant_2.4.1_windows_amd64.msi -O vagrant_2.4.1_windows_amd64.msi


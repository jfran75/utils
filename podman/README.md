## podman

## install podman
```
brew install podman
podman machine init
podman machine start
podman info
podman version


rm -rf ~/.config/containers/
rm -rf ~/.local/share/containers
rm ~/.ssh/podman*

brew install podman podman-desktop
brew uninstall podman podman-desktop qemu
brew uninstall podman-desktop
brew uninstall podman
brew uninstall qemu

export CONTAINERS_MACHINE_PROVIDER=applehv
echo $CONTAINERS_MACHINE_PROVIDER

podman machine init
podman machine start
podman --log-level=debug machine start

podman system connection list

EFI_RNG_PROTOCOL unavailable


# Add the 2 lines below below to ~/.config/containers/containers.conf
nvim ~/.config/containers/containers.conf
[machine]
provider="applehv"

ERRO[0005] unable to read gvproxy pid file /var/folders/7v/3999hydj2972kq9chydqp2tm0000gn/T/podman/gvproxy.pid: open /var/folders/7v/3999hydj2972kq9chydqp2tm0000gn/T/podman/gvproxy.pid: no such file or directory 
```

## config files paths
```
sudo nvim /etc/containers/registries.conf

### add a registries
nvim ~/.config/containers/registries.conf
  - unqualified-search-registries = ["docker.io", "quay.io", "ghrc.io"]



```

## commands
```
podman info
podman version
podman search {image_name}
podman pull {image_name}
podman images
podman run -it {image_name} /bin/bash
podman run -it -p 8080:8080 {image_name}
podman ps -a
podman rm {container_id}
podman rmi {image_id}
podman build -t {image_name} .

podman pod create --name {pod_name}
podman pod ls
podman pod start {pod_name}
podman pod stop {pod_name}
podman pod rm {pod_name}
podman pod inspect {pod_name}

# qemu commands
qemu-img create -f qcow2 -o preallocation=metadata {image_name} {size}



```

## example
```
podman run -it --rm --name my-busybox busybox /bin/sh
podman run -it --rm --name my-busybox busybox
rm -rf ~/.config/containers/
rm -rf ~/.local/share/containers
rm ~/.ssh/podman*
`
```

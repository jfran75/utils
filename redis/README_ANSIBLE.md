# install redis cluster with ansible
```
ansible all -m ping
```

## install redis cluster with ansible-galaxy
```
ansible-galaxy collection install community.general

ansible-galaxy init redis

## create a pwd
ansible-vault encrypt --valut-id .vault_pass

ansible-playbook -i hosts.yml install.yaml --vault-password-file .vault_pass

```

## test this galaxy ansible role
- https://github.com/DavidWittman/ansible-redis?tab=readme-ov-file#redis-sentinel
- https://galaxy.ansible.com/ui/standalone/roles/DavidWittman/redis/documentation/
- https://www.youtube.com/watch?v=C8PwcN2KNCg
```

```


## test with docker-compose
- https://medium.com/@jielim36/basic-docker-compose-and-build-a-redis-cluster-with-docker-compose-0313f063afb6
- https://ilhamdcp.hashnode.dev/creating-redis-cluster-with-docker-and-compose
```

```
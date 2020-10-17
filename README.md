Description
=========
ANSIBLE ROLE for auto install Docker and setup docker swarm cluster


Dependencies
------------
- no dependencies


Workflow
------------
- if docker was installed
  - if node in swarm mode
    - leave swarm mode
  - uninstall current docker
- install docker
- setup docker swarm
  - if host in leader group
    - init docker swarm
    - get swarm join-token for managers hosts
    - get swarm join-token for workers hosts
  - if host in manager group
    - join to swarm with manager token
  - if host in worker group
    - join to swarm with worker token


Default Role Variables
--------------

```yml
# set to 'no' if you don't want to reinstall docker
docker_reinstall: yes

## values:
##    worker | manager | leader
##
## decription:
##    leader: only one leader in a docker swarm, the following tasks to do:
##      - docker swarm init
##      - get token for managers
##      - get token for workers
##    manager: join to docker swarm with manager role
##    worker: join to docker swarm with worker role
docker_swarm_node: worker
```

How use this ROLE
----------------
1. In your inventory file, you need to create 3 groups with 3 different `docker_swarm_node` variables and place the hosts in the appropriate group
```yaml
# inventory.yml
your_group:
  child:
    leader:
      hosts:
        - ....
      vars:
        docker_swarm_node: leader
    manager:
      hosts:
        - ....
      vars:
        docker_swarm_node: manager
    worker:
      hosts:
        - ....
      vars:
        docker_swarm_node: worker
```
2. declare docker role in your playbook
```yaml
# playbook.yml
- name: ""
  host: ""
  roles:
    - docker
```

License
-------
MIT

Author Information
------------------
name: Duong Tan Phat
email: dtanphat9388@gmail.com

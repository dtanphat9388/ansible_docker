Role Name
=========

Docker

Requirements
------------

if (vars.docker_reinstall == "yes") {
  - if (docker was installed)
    - check node is in swarm mode
    - if (swarm mode != "inactive")
      - leave swarm mode
      - then uninstall docker
  - else install docker
}

Role Variables
--------------


```yml
# set to 'yes' if you want reinstall docker
docker_reinstall: no

## leader: 
##    - `docker swarm init` and `docker swarm join-token worker|manager`
##    - clone ilotusland installer and setup
## manager: join to docker swarm with manager role
## worker: join to docker swarm with worker role
docker_swarm_mode: worker      # worker | manager | leader
```

Dependencies
------------

A list of other roles hosted on Galaxy should go here, plus any details in regards to parameters that may need to be set for other roles, or variables that are used from other roles.

Example Playbook
----------------

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

    - hosts: servers
      roles:
         - { role: username.rolename, x: 42 }

License
-------

BSD

Author Information
------------------

An optional section for the role authors to include contact information, or a website (HTML is not allowed).

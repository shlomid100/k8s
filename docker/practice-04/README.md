# Ansible installation based on Docker
## Highlight steps:
- docker run ansible-slave
- Set it correctly
- docker run ansible-master
- Set it correctly
- Create inventory configuration file


### Test via ansible ping
```
ansible -m ping all
```
- output
```
10.132.0.41 | SUCCESS => {
    "changed": false,
    "ping": "pong"
}
```

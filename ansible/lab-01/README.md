# Ansible common commands
```
ifconfig
ssh ansible@ansible-slave
ssh ansible@ansible-master
ifconfig
exit
hostname -i
ls
pwd
cd home/
cat inventory.yml
ls -ltra
chmod 777 inventory.yml
ansible all -i inventory.yml -m ping
/usr/sbin/sshd
netstat -tlnp | grep :22
ansible all -i inventory.yml -m ping
ansible --version
ansible all -i inventory.yml -m ping -v
ansible all -i inventory.yml -m ping -vv
ansible all -i inventory.yml -m ping -vvv
ansible-inventory -i inventory.yml --graph
ansible all -i inventory.yml --list
ansible all -i inventory.yml -m shell -a "echo Hello from $(hostname)"
hostname
ansible all -i inventory.yml -m shell -a "echo Hello from $(ls)"
ls
ansible all -i inventory.yml -m shell -a "echo Hello from $(ls -ltra)"
ansible all -i inventory.yml -m shell -a "echo Hello from $(ls -la)"
ansible all -i inventory.yml -m shell -a "echo Hello from $(pwd)"
id
su ansible
cat /etc/passwd | grep -i ansib
ssh ansible@ansible-slave
echo "hello test" > hello.txt
ls
cat hello.txt
ansible all -i inventory.yml -m copy -a "src=hello.txt dest=/tmp/hello.txt"
ssh ansible@ansible-slave
ifconfig
ls
ansible all -i inventory.yml -m shell -a "ping -c 1 google.com"
ping -c 1 google.com
ansible all -i inventory.yml -a "df -h"
ansible all -i inventory.yml -a "uptime"
    # Create Playbook
cat playbook-apache.yml
ansible-playbook -i inventory.yml playbook-apache.yml --syntax-check
ansible-playbook -i inventory.yml playbook-apache.yml

```

## Create new playbook-apache


```
tee playbook-apache.yml > /dev/null <<EOF
- hosts: slaves
  become: yes
  gather_facts: no

  tasks:

    - name: Update packages
      apk:
        update_cache: yes

    - name: Install Apache + OpenRC
      apk:
        name:
          - apache2
          - openrc
        state: present

    - name: Create OpenRC runtime directory
      file:
        path: /run/openrc
        state: directory

    - name: Initialize OpenRC (Docker safe)
      shell: |
        openrc || true
        touch /run/openrc/softlevel

    - name: Add Apache to runlevel
      shell: rc-update add apache2 || true

    - name: Stop Apache safely
      shell: rc-service apache2 stop || true

    - name: Start Apache
      shell: rc-service apache2 start || httpd

EOF

```

## Docker Persistent Volume

### Types of volumes
- automatic volumes
- named volumes
- volume binding
  
#### Automatic Volumes - Do it with WSL
```
docker container run  -idt --name vt01 -v /var/lib/mysql  alpine sh
docker images
docker ps
docker inspect vt01 | grep -i mounts -A 10
```
#### Named volumes - Do it with WSL

```
docker container run  -idt --name vt02 -v db-data:/var/lib/mysql  alpine sh
docker inspect vt02 | grep -i mounts -A 10
```

#### Volume binding -  Do it with WSL
```

mkdir /root/sysfoo
docker container run  -idt --name vt03 -v /root/sysfoo:/var/lib/mysql  alpine sh
docker inspect vt03 | grep -i mounts -A 10
sudo -s cd root/
pwd
sudo mkdir sysfoo
cd sysfoo/
cd ../
sudo chmod 777 /root/sysfoo
docker ps
docker run -dit --name vt03 -v /root/sysfoo:/var/lib/mysql alpine sh
docker inspect vt03 | grep -i mounts -A 10
sudo -s cd root/sysfoo
pwd
touch /root/sysfoo/file1
sudo -s touch /root/sysfoo/file1
sudo -s ls /root/sysfoo/
docker exec -it vt03 sh
ls /var/lib/mysql
  #You should see:
file1

  # Test reverse (container → host) Inside container:
touch /var/lib/mysql/file2
exit
  #On host:
ls /root/sysfoo
  # You should see:
file1 file2

```

#### See volumes and cleanup

```
docker volume ls
Inspect volume:
docker volume inspect db-data

docker rm -f vt01 vt02 vt03
docker volume rm db-data
```


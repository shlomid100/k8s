# Installation of Docker Desktop 

# Hands-On – Lab-01 - Getting Started with Docker
**Installation:​**
  - Steps to install Docker on different platforms (Windows, macOS, Linux).​
  - Basic Commands:
  - docker --version​
  - docker run hello-world​
  - docker ps​
  - docker images

**Bonus Questions**
- Find the commands of LXC Provides Independence & Implemented Using​
- Run command on both cli (cmd ipconfig, wsl ip addr) why its diff ?  

## Solution:

- Go to the link and install it step by step following the instruction:
  https://docs.docker.com/desktop/install/windows-install/
- Go to the cli of WSL and check the version of Docker
```
docker info
docker version
```

## Basic Docker commands:
```
docker ps
docker ps -a
docker images
```

### Docker pull hello-world
- Open the cli of WSL and Pull your first image
  
```
docker pull hello-world
```

- Go to https://hub.docker.com/_/hello-world -> Shared Tags -> latest:linux
in order to see the Dockerfile
- **It is just prompt via cli hello-world**


### Linux Container (LXC) - Bonus Solution
- LXC (Linux Containers) is part of the Ubuntu ecosystem,
  But it's not installed by default, Its official support on Ubuntu 12.04+

| Category     | Description | 
|--------------|-------------|
|What LXC provides (independent)       |File system, process tree, networking stack|
|What LXC uses (implementation)	   |Namespaces, cgroups, capabilities (UFS)	| 

## LXC Provides Independence isolated environments that LXC offers for containers:
- Display the File System - Each container has its own root filesystem (separate from host)
- Display the process tree - Processes inside the container are separate and isolated from the host
- Display the Networking Stacks - Each container has its own network interfaces, routing table, IP stack
  
```
  # Display the File System
ls -l /
tree -L 2 / 2>/dev/null || ls -l /

  # Display the process tree 
ps -ef --forest
pstree -p

  # Display the Networking Stacks - made up of various layers
ip addr
netstat -rn || ip route

```


These create the illusion that each container is its own standalone Linux system.
## LXC Is Implemented Using
These are the Linux kernel features that make LXC’s independence possible

- Namespaces	Provide isolation (PID, NET, IPC, UTS, MNT, USER)
- cgroups (Control Groups)	Limit and monitor resource usage (CPU, RAM, I/O)
- Capabilities (UFS)	Drop or assign fine-grained root privileges

```
  #HOST NAMESPACES, is isolate container processes from the host
lsns

  # HOST CGROUPS
  # 402 - is PID of user dinghy in cgroups under wsl cli
ls -l /proc/402/cgroup

  # Capabilities are fine-grained privileges (e.g., CAP_NET_ADMIN, CAP_SYS_ADMIN).
grep Cap /proc/402/status
capsh --print
```


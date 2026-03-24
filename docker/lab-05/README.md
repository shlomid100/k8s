# Hands-On – Lab-02 Docker commands based on httpbin

```
docker run --name http_error -d -p 8990:80 kennethreitz/httpbin
http://localhost:8990/
docker stop <container id>
docker start <container id>
docker reststart <container id>
docker exec -it http_error bash
docker ps
docker ps -a
docker images
docker rm -f <container id>
docker rmi -f <container id>
docker exec -it http_error bash

# echo "fix bug 1010" > fix-bug1010.txt
docker commit aef7717dea84 http_error:fix1010
docker ps
docker images | grep -i http
docker run --name http_error -d -p 8900:80 5872ce97baad
docker ps
docker tag 5872ce97baad dinghy123/http_error:fix1010
docker images
docker push dinghy123/http_error:fix1010
```



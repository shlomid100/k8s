# Hands-On – Lab-02 monopoly game
- Docker pull and run the monopoly game on one command​
- Browse via Google Chrome​
- Display the images​
- Display the container run time and exited

## Solution: monopoly game
```
docker run -it --name monopoly_8443 -p 8443:8443 gonzague/monopoly
https://localhost:8443/
docker images
docker ps -a
```

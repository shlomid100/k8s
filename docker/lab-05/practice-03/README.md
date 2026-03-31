1. # Hands-On – Bonus mysql db Basic Commands​
- Docker pull mysql​
- Docker run with port 3406​
- List of all images​
- Go inside a running mysql container​
- Go to Cli of mysql and show all database
- select * from user 

2. # Based on Hands-On– Lab-03 Dockerfile simple app Hello world
- Go into Docker container and change the app
- Save the images with 1.0 tag
- Create TAR file from new iamge tag


3. # Bonus Hands-On - Docker Argument port
- See the bash file arg-example.sh 
- Based on Dockerfile
  - Create a html page file with title **Docker Argument port**
  - Build image
  - Set tag and push it into your docker hub
  - Docker run with port 5023
  - Make sure its runing via the Browser
  - Remove the image and and container id **docker run time**
  - Pull the image from your docker hub
  - Docker run with two diffrent port
    - .i.e
```
http://localhost:5023
http://localhost:5024
```

- Run the docker top, stats, inspect commands
- Copy the index.html file from docker container to your host, one dir back


## Solution: Hands-On - Docker Argument port
```
echo "<h1>Docker Argument port</h1>" > index.html
```


```
docker build -t html-server .
docker run -d   --name web5023   -e PORT=5023   -p 5023:5023   html-server
docker ps
docker run -d   --name web5024   -e PORT=5024   -p 5024:5024   html-server
docker ps
```


```
docker top 4740efe3ae05
docker stats 4740efe3ae05
docker inspect 4740efe3ae05
docker logs --follow 4740efe3ae05
docker logs 4740efe3ae05 | less
docker exec -it 4740efe3ae05 sh
  # Edit the index.html via vi to Docker Argument port new
docker cp 4740efe3ae05:/app/index.html ../lab-01/
cat ../lab-01/index.html
rm -Rf ../lab-01/index.html

```


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

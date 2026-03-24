# Change the Dinner Suggestion to New Menu with new tag and expose port
1. based on lab-04, change the title **Dinner Suggestion** to **New Menu Dinner Suggestion**
2. Docker run with new port 5001
3. Set a new tag inmage 1.01
4. Execute both Docker run and browse via google chrome

# Output should be
```
http://localhost:5000
Dinner Suggestion
http://localhost:5001
New Menu Dinner Suggestion
```


# Hands-On– Lab-03 Dockerfile simple app Hello world
1. Create the python app which print **hello world**
```
cat <<EOF > ../lab-02/hello-world.py
print("Hello World from Python in Docker!")
EOF
```
```
cat ../lab-02/hello-world.py
```
2. Create Dockerfile via vi editor
```
cat <<EOF > ../lab-02/Dockerfile
FROM python:3.11-alpine
WORKDIR /app
COPY hello-world.py .
CMD ["python", "hello-world.py"]
EOF
```
```
cat ../lab-02/Dockerfile
```
3. Build Docker Image
```   
docker build -t python-hello ../lab-02/
docker images
```
4. Run Docker Container
```
docker run --rm python-hello
docker ps
docker ps -a
```
**Note --rm flag** Is auto-Cleanup by default.
Docker containers remain on your disk in a **Stopped** state after they finish running.
The --rm flag ensures the container is deleted immediately upon exit,
preventing a buildup of unused containers

5. Cleanup
```
rm -Rf ../lab-02/hello-world.py Dockerfile
```

## Hands-On– Lab-03-01 Dockerfile Dinner Suggestion
- Run the app without dockerfile
```
py.exe app.py
http://127.0.0.1:5000/
```

- Run the app with dockerfile

```
docker build -t dinner_flask_lh_app .
docker images
docker run -d -p 5099:5000 dinner_flask_lh_app
http://localhost:5099/
```

- Docker tag, push and pull

```
docker images
docker ps
docker tag dinner_flask_lh_app xyz/dinner_flask_lh:latest
docker push xyz/dinner_flask_lh:latest
docker pull xyz/dinner_flask_lh:latest
```



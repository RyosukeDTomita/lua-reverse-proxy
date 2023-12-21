#!/bin/bash
docker rmi $(docker images -q -a) -f
docker rm $(docker ps -q -a)
docker compose up
#docker build -t myapp:latest .
#docker run -p 80:80 myapp:latest

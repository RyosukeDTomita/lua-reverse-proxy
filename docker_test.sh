#!/bin/bash
docker build -t myapp:latest .
docker run -p 80:80 myapp:latest

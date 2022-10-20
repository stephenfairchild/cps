#!/bin/bash
# Start script to be used to start the application
app="cps.platform"

docker stop $app
docker rm $app
docker build -t ${app} .
docker run -d -p 56733:8080 \
  --name=${app} \
  -v $PWD:/app ${app}

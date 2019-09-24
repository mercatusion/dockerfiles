#!/bin/bash

sudo docker login -u $1 -p $2 docker.mercatusion.com:5000

sudo docker build --no-cache -t lisp-env -f lisp-env.dockerfile . 
sudo docker tag lisp-env docker.mercatusion.com:5000/lisp-env
sudo docker push docker.mercatusion.com:5000/lisp-env

sudo docker build --no-cache --build-arg GITHUB_USER=$3 --build-arg GITHUB_PASS=$4 -t mercatus-core -f mercatus-core.dockerfile .
sudo docker tag mercatus-core docker.mercatusion.com:5000/mercatus-core
sudo docker push docker.mercatusion.com:5000/mercatus-core

sudo docker build --no-cache -t mercatus-client -f mercatus-client.dockerfile .
sudo docker tag mercatus-client docker.mercatusion.com:5000/mercatus-client
sudo docker push docker.mercatusion.com:5000/mercatus-client

sudo docker build --no-cache -t mercatus-service -f mercatus-service.dockerfile .
sudo docker tag mercatus-service docker.mercatusion.com:5000/mercatus-service
sudo docker push docker.mercatusion.com:5000/mercatus-service

sudo docker build --no-cache -t mercatus-repl -f mercatus-repl.dockerfile .
sudo docker tag mercatus-repl docker.mercatusion.com:5000/mercatus-repl
sudo docker push docker.mercatusion.com:5000/mercatus-repl

#!/bin/bash

sudo docker login -u $1 -p $2 docker.mercatusion.com:5000

sudo docker pull docker.mercatusion.com:5000/lisp-env
sudo docker pull docker.mercatusion.com:5000/mercatus-core
sudo docker pull docker.mercatusion.com:5000/mercatus-client
sudo docker pull docker.mercatusion.com:5000/mercatus-service
sudo docker pull docker.mercatusion.com:5000/mercatus-repl

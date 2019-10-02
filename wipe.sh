#!/bin/bash

sudo docker login -u $1 -p $2 docker.mercatusion.com:5000

sudo docker tag lisp-env docker.mercatusion.com:5000/mercatus-core
sudo docker push docker.mercatusion.com:5000/mercatus-core

sudo docker tag lisp-env docker.mercatusion.com:5000/mercatus-client
sudo docker push docker.mercatusion.com:5000/mercatus-client

sudo docker tag lisp-env docker.mercatusion.com:5000/mercatus-service
sudo docker push docker.mercatusion.com:5000/mercatus-service

sudo docker tag lisp-env docker.mercatusion.com:5000/mercatus-repl
sudo docker push docker.mercatusion.com:5000/mercatus-repl

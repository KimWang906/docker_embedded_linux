#!/bin/bash

if [ "$(sudo docker ps -aq -f name=embedded_linux)" ]; then
    sudo docker rm -f embedded_linux
fi

sudo docker build --network host -t embedded_linux-18.04:0.0 `pwd`
sudo docker run --name embedded_linux --security-opt seccomp=unconfined --net host -i -t embedded_linux-18.04:0.0
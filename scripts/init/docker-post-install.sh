#!/bin/bash

# run docker as user
sudo groupadd docker;
sudo usermod -aG docker $USER;
docker run hello-world

# enable services
sudo systemctl enable docker.service;
sudo systemctl enable containerd.service;

newgrp docker;
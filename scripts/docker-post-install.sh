# run docker as user
sudo groupadd docker;
sudo usermod -aG docker $USER;
newgrp docker;

# enable services
sudo systemctl enable docker.service;
sudo systemctl enable containerd.service;
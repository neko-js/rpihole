#!/bin/bash

# Post Docker Steps
sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker
sudo chmod 666 /var/run/docker.sock

# Verify Installation
docker -v
docker run hello-world

# Start Pihole
docker compose up -d

# Display Finished Message
echo ""
echo "Installation is finished."
echo "Set your device DNS to $(hostname -I | cut -d' ' -f1)"
echo "You can reach the UI under: http://$(hostname -I | cut -d' ' -f1)/admin"

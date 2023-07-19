#!/bin/bash

# Check if the script is running with root privileges
if [[ $EUID -ne 0 ]]; then
    echo "This script must be run as root." >&2
    exit 1
fi

# Update first
apt-get update

# Set up screen
apt-get install -y screen
echo "caption always \"%{= kw}%-w%{= kG}%{+b}[%n %t]%{-b}%{= kw}%+w %= [%l] %0c:%s %{-}\"
startup_message off" >> .screenrc

# Setting up Samba home folder
apt-get install -y samba

# Add Samba configuration for home folder
echo "[picloud-home]
 comment=picloud-home
 path=/home/pi
 browseable=yes
 writeable=yes
 only guest=no
 create mask=0740
 directory mask=0750
 public=no" >> /etc/samba/smb.conf

# Set Samba user
smbpasswd -a pi

echo "Samba configuration finished."

# Install Docker
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh

# Docker Installation Sets us into root user
su - pi -c '
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
    echo "You can reach the UI under: http://$(hostname -I | cut -d' ' -f1)/admin"'

exit

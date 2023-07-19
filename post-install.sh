#!/bin/bash

# Start Pihole
docker compose up -d

# Display Finished Message
echo ""
echo "Installation is finished."
echo "Set your device DNS to $(hostname -I | cut -d' ' -f1)"
echo "You can reach the UI under: http://$(hostname -I | cut -d' ' -f1)/admin"
echo "The default password is pihole123"

#!/bin/bash

# Set the hostname
echo "ansible_server" > /etc/hostname

# Inform the user to run the post-reboot script after the server restarts
echo "Please run 'setup_ansible_post_reboot.sh' after the server restarts."

# Reboot the server
reboot
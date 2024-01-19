# Set the hostname
echo "jenkins_server" > /etc/hostname

# Inform the user to run the post-reboot script after the server restarts
echo "Rebooting...."

# Reboot the server
reboot
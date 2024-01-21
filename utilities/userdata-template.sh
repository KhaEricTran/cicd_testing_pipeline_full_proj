#!/bin/bash

echo "sudo su -" >> /home/ec2-user/.bashrc
public_ipv4=$(curl -s http://checkip.amazonaws.com/)

sudo su -

echo "source /root/init_repo.sh" >> /root/.bashrc
echo "cd COSC2767_Assignment3_FinalAssignment/" >> /root/.bashrc

echo '
#!/bin/bash

# Check if COSC2767_Assignment3_FinalAssignment/ exists
if [ -d "COSC2767_Assignment3_FinalAssignment" ]; then
    echo "Removing COSC2767_Assignment3_FinalAssignment/..."
    rm -rf COSC2767_Assignment3_FinalAssignment/
    echo "COSC2767_Assignment3_FinalAssignment/ removed."
fi

git clone -b dev https://github.com/RMIT-DevOps-Hackathon/COSC2767_Assignment3_FinalAssignment.git

# Navigate to the COSC2767_Assignment3_FinalAssignment directory
cd ~/COSC2767_Assignment3_FinalAssignment/utilities

# Find all Bash script files and make them executable
find . -type f -name "*.sh" -exec chmod +x {} \;

echo "Bash script files in assignment-3 directory made executable."
cd ~
' >> /root/init_repo.sh

chmod +x /root/init_repo.sh

# Install Git
sudo yum install git -y

########## Custom Setup goes below ##########

service sshd reload

reboot
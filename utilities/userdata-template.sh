#!/bin/bash

echo "sudo su -" >> /home/ec2-user/.bashrc
public_ipv4=$(curl -s http://checkip.amazonaws.com/)

sudo su -

echo "source /root/init_repo.sh" >> /root/.bashrc
echo "cd cicd_testing_pipeline_full_proj/" >> /root/.bashrc

echo '
#!/bin/bash

# Check if cicd_testing_pipeline_full_proj/ exists
if [ -d "cicd_testing_pipeline_full_proj" ]; then
    echo "Removing cicd_testing_pipeline_full_proj/..."
    rm -rf cicd_testing_pipeline_full_proj/
    echo "cicd_testing_pipeline_full_proj/ removed."
fi

git clone https://github.com/KhaEricTran/cicd_testing_pipeline_full_proj.git

# Navigate to the cicd_testing_pipeline_full_proj directory
cd ~/cicd_testing_pipeline_full_proj/utilities

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
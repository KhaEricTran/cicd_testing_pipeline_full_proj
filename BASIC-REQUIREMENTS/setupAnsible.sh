#!/bin/bash

# Update system
sudo yum update -y

# Install Ansible
sudo yum install ansible2 -y

# Install Git
sudo yum install git -y

# Clone the Git repository
git clone https://github.com/KhaEricTran/cicd_testing_pipeline_full_proj.git

# Navigate to the directory containing the playbook
cd cicd_testing_pipeline_full_proj

# Create an inventory file
echo -e "[aws_ec2]\nlocalhost ansible_connection=local" > hosts.ini

# Execute the Ansible playbook
ansible-playbook -i hosts.ini jenkins_aws_ec2_playbook.yml
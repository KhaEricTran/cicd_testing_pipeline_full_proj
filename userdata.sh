# setting default region
aws configure set default.region us-east-1

# Installing dependencies
yum install git -y
yum install nano -y

# Retrieve the SSH private key from SSM
SSH_PRIVATE_KEY=$(aws ssm get-parameter --name "github_PK" --with-decryption --query "Parameter.Value" --output text)

# Setup SSH key 
mkdir -p /root/.ssh
echo "$SSH_PRIVATE_KEY" > /root/.ssh/id_rsa

# Set permissions
chmod 600 /root/.ssh/id_rsa

#regenerate public key from private key
ssh-keygen -y -f ~/.ssh/id_rsa > ~/.ssh/id_rsa.pub


# Add github.com to known hosts
echo -e "Host github.com\n\tHostName github.com\n\tuser git\n\tIdentityFile /root/.ssh/id_rsa\n" > /root/.ssh/config

# Set permissions
chmod 644 /root/.ssh/config

# add github to known hosts
ssh-keyscan github.com >> ~/.ssh/known_hosts

# Git configuration
git config --global user.email "s3878076@rmit.edu.vn"
git config --global user.name "Duy Nguyen"
git config --global init.defaultBranch main

# Clone the project repository
cd ~
REPO_NAME=COSC2767_Assignment3_FinalAssignment

rm -rf $REPO_NAME

git clone git@github.com:RenuzitV/$REPO_NAME.git

cd $REPO_NAME

# Make script executable
cd BASIC-REQUIREMENTS
chmod +x script.sh

./script.sh
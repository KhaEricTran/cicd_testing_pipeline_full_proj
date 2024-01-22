sudo yum update -y
sudo amazon-linux-extras install ansible2 -y
sudo yum install git -y
git clone https://github.com/KhaEricTran/cicd_testing_pipeline_full_proj.git
ansible-playbook -i hosts.ini jenkins_aws_ec2_playbook.yml
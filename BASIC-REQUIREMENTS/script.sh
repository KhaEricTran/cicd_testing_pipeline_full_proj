yum install docker -y

# install kubectl on host machine for monitoring
curl -o kubectl https://s3.us-west-2.amazonaws.com/amazon-eks/1.28.3/2023-11-14/bin/linux/amd64/kubectl \
    && chmod +x ./kubectl \
    && mv ./kubectl /usr/local/bin/kubectl

aws eks update-kubeconfig --name devops-eks-cluster --region us-east-1

systemctl start docker

# deploy Jenkins for CI/CD

cd Jenkins

chmod +x jenkins-build.sh

./jenkins-build.sh

chmod +x jenkins-script.sh

./jenkins-script.sh

cd ..

# deploy Prometheus for cluster monitoring

cd Prometheus

chmod +x prometheus-deploy.sh

./prometheus-deploy.sh

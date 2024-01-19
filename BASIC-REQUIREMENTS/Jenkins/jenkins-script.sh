#   RMIT University Vietnam
#   Course: COSC2767 Systems Deployment and Operations
#   Semester: 2023C
#   Assessment: Assignment 1
#   Author: Nguyen Vu Minh Duy
#   ID: s3878076
#   Created  date: 27/11/2023 (e.g. 31/07/2023)
#   Last modified: 02/12/2023 (e.g. 05/08/2023)
#   Acknowledgement: 
# https://stackoverflow.com/questions/30494050/how-do-i-pass-environment-variables-to-docker-containers

JENKINS_REPO_URI=959445117732.dkr.ecr.us-east-1.amazonaws.com/jenkins

docker kill jenkins

docker rm jenkins

docker run -d -v /var/run/docker.sock:/var/run/docker.sock -p 8080:8080 --name jenkins $JENKINS_REPO_URI:latest


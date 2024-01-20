JENKINS_REPO_URI=3750945/jenkins

docker kill jenkins

docker rm jenkins

docker run -d -v /var/run/docker.sock:/var/run/docker.sock -p 8080:8080 --name jenkins $JENKINS_REPO_URI:latest
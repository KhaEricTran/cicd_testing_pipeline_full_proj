JENKINS_REPO_URI=3750945/jenkins

echo "040421Ed!" | docker login --username 3750945 --password-stdin

docker build --build-arg DOCKER_GROUP_ID=$(getent group docker | cut -d: -f3) -t jenkins .

docker tag jenkins:latest $JENKINS_REPO_URI:latest

docker push $JENKINS_REPO_URI:latest

yes | docker image prune -a

yes | docker volume prune -a

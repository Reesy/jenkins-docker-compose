FROM jenkins/jenkins

#The idea for this came from https://stackoverflow.com/questions/60001931/how-to-get-docker-compose-to-work-in-docker-generated-jenkins-pipeline-on-window 
#It requires that the docker.sock file is mounted so that Jenkins can use docker and docker-compose 
# docker run --rm -p 8080:8080 -p 50000:50000 --name <desiredContainerName>  -v /var/run/docker.sock:/var/run/docker.sock -v jenkins_home:/var/jenkins_home <imagename>
USER root

# see https://docs.docker.com/compose/install/
RUN curl -L \
  "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" \
  -o /usr/local/bin/docker-compose \
  && chmod +x /usr/local/bin/docker-compose \
  && chown -R jenkins:jenkins /usr/local/bin/docker-compose
#I want to give permissions for the jenkins user to read, write and execute /usr/local/bin/docker-compose



# USER jenkins
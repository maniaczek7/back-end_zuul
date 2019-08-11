#!/bin/bash
# remember to click maven/gradle install to create JAR file!
./gradlew clean build
eval $("C:\Program Files\Docker Toolbox\docker-machine.exe" env dev)
eval $("C:\Program Files\Docker Toolbox\docker-machine.exe" env dev)
docker build -t rmichniewskihome/application:zuul .
docker push rmichniewskihome/application:zuul
ssh ec2 docker pull rmichniewskihome/application:zuul
ssh ec2 docker rm -f zuul
#ssh ec2 docker run -d --name=zuul -p 8762:8762 --rm rmichniewskihome/application:zuul
ssh ec2 docker run -d --name=zuul -p 80:80 --rm rmichniewskihome/application:zuul
ssh ec2 docker ps

#Installing Jenkins and making a demo project
#Source :- https://github.com/devopsjourney1/jenkins-101
#Adding jenkins native agent :- https://www.pluralsight.com/resources/blog/cloud/adding-a-jenkins-agent-node
# Creating pipeline :- 

#1. Install git
sudo apt install git

#2 Clone repo from github
git clone https://github.com/devopsjourney1/jenkins-101.git
    #Above link is for testing jenkins files

#3 Install docker 
sudo apt install docker.io

#4 Install docker compose
sudo apt install docker-compose

#5 Add docker to sudo user
sudo groupadd docker
sudo usermod -aG docker $USER
    #Now logout and log back in to check

#6 Create a jenkins network (bridge mode)
docker network create jenkins

# Clone the repo from github
git clone https://github.com/devopsjourney1/jenkins-101.git

# Create an image from the dockerfile
docker build -t myjenkins-blueocean:2.414.2 .

#7 run the docker container

docker run --name jenkins-blueocean --restart=on-failure --detach \
  --network jenkins --env DOCKER_HOST=tcp://docker:2376 \
  --env DOCKER_CERT_PATH=/certs/client --env DOCKER_TLS_VERIFY=1 \
  --publish 8080:8080 --publish 50000:50000 \
  --volume jenkins-data:/var/jenkins_home \
  --volume jenkins-docker-certs:/certs/client:ro \
  myjenkins-blueocean:2.414.2

#8 Ensure to open port 8080 Aand 50000

#New Version Alarm
#New version of Jenkins (2.426.1) is available for download (changelog). 

# 9 
Go to Manage>cloud provider and install docker

# 10 Create a socket docker conatainer in the cli(This container will work as the permanent agent for the master)
docker run -d --restart=always -p 2376:2375 --network jenkins -v /var/run/docker.sock:/var/run/docker.sock alpine/socat tcp-listen:2375,fork,reuseaddr unix-connect:/var/run/docker.sock

# 11 Inspect the container
docker inspect <container name>

# 12 Copy paste the IP address of the container

"NetworkID": "de66672ac582b9a8b38e995474b2f488ccc91258ae9c8b4df7a95dcc7faaf6d3",
"EndpointID": "2d4272670a6162f71570e20bc91485910274e5a0c3ff645b94d47ec12947e283",
"Gateway": "172.18.0.1",
"IPAddress": "172.18.0.3",    #This is the ip
"IPPrefixLen": 16,
"IPv6Gateway": "",
"GlobalIPv6Address": "",
"GlobalIPv6PrefixLen": 0,
"MacAddress": "02:42:ac:12:00:03",
"DriverOpts": null

# 13 Go to Jenkins UI and create a cloud docker

# 14 Go to configure of the above docker cloud and Select Docker Agent Templates > 












#API to stop a running workflow
http://172.172.175.32:8080/computer/docker%2Dagent%2Dalpine%2D0002oikbvsdmu/executors/0/stopBuild?runExtId=

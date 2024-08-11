#!/bin/bash


#Deploying Django app

code_clone() {
	echo "lets clone the Django app......"
	git clone https://github.com/LondheShubham153/django-notes-app.git

}

install_req() {
  	echo "Installing dependencies"
	sudo apt-get install docker.io nginx -y docker-compose

}

required_restart(){
	sudo usermod -aG docker $USER
	sudo systemctl enable docker
	sudo systemctl enable nginx
	sudo systemctl restart docker

}

deploy() {
  	docker build -t notes-app .
	docker run -d -p 8000:8000 notes-app:latest
#	docker-compose up -d
}

echo "*************deployment started***********************"

if ! code_clone; then
	echo "If show code  already exits then"
	cd django-notes-app
fi

if ! install_req; then
	echo "Installation failed"
	exit 1
fi


if ! required_restart; then
	echo "Sysyem faut identified"
	exit 1
fi

if ! deploy; then
	echo "Deployment failed "
	exit 1
fi	

echo "*************deployment done***********************"


#!/bin/bash

# Install docker
sudo apt update -y
sudo apt install docker.io -y

# create .env file
cat <<EOF > /home/ubuntu/.env
# Server
HOST=0.0.0.0
PORT=1337

# Secrets
APP_KEYS=KVozPDcMLJoeDfU2kU4jqQ==,YtPI8ep/NOwSpjbC++5rBg==,/jUEMQ9IyPOU6vFIYiFpgQ==,4anKn39+LSQNiNNDoexJIw==
API_TOKEN_SALT=V/qBXwnXn0xf6A6KQP14tQ==
ADMIN_JWT_SECRET=mVISSjAr2gX81V10mjacNA==
TRANSFER_TOKEN_SALT=KEsmUJvep0HsIUaud/7eFQ==
ENCRYPTION_KEY=x/VX6cOsLMrVt70wxCpj6Q==

# Database
DATABASE_CLIENT=sqlite
DATABASE_HOST=
DATABASE_PORT=
DATABASE_NAME=
DATABASE_USERNAME=
DATABASE_PASSWORD=
DATABASE_SSL=false
DATABASE_FILENAME=.tmp/data.db
JWT_SECRET=bdipEHxkpPS5PNwYpj0dLA==
EOF

# Pull docker image and run 
sudo docker run -d --name Strapi_cont -p 1337:1337 --env-file {{docker_image}}

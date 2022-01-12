#! /bin/bash

## Dependencies:

## Docker 
## Docker Compose

echo: "xhost + local:docker"

echo "Install in: $PWD"

MM_CONFIG=$PWD/MagicMirrorServer/config
MM_MODULES=$PWD/MagicMirrorServer/modules
MM_CSS=$PWD/MagicMirrorServer/css

xhost + local:docker

echo "MagicMirror Config: $MM_CONFIG"
mkdir -p $MM_CONFIG

echo "MagicMirror Modules: $MM_MODULES"
mkdir -p $MM_MODULES

echo "MagicMirror CSS: $MM_CSS"
mkdir -p $MM_CSS

# Download Docker-compose file

curl -s 'https://raw.githubusercontent.com/FrancescoZanti/MagicMirror-Docker/master/docker-compose.yml' -o docker-compose.yml

# Docker-compose start

docker-compose up -d


# Copy Default Files

curl -s 'https://raw.githubusercontent.com/FrancescoZanti/MagicMirror-Docker/master/MagicMirrorServer/config/config.js' -o $MM_CONFIG/config.js
curl -s '' 
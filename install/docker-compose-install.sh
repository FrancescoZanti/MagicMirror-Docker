#! /bin/bash

## Dependencies:

## Docker 
## Docker Compose

## version

version=$(date +%Y.%m) 

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

curl --location --remote-header-name --remote-name -s 'https://github.com/FrancescoZanti/MagicMirror-Docker/releases/download/v$version/MagicMirror-Docker-utils.tar.gz' -o MagicMirror-Docker-utils.tar.gz -o MagicMirror-Docker-utils.tar.gz 
tar xf MagicMirror-Docker-utils.tar.gz

cp js/config.js $MM_CONFIG/config.js
cp -R modules/default $MM_MODULES


rm -rf MagicMirror-Docker-utils.tar.gz js/ modules/

echo "Magic Mirror installed: $PWD/MagicMirrorServer/"
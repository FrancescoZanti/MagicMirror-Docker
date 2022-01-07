#! /bin/bash

echo "Starting MagicMirrorClient"

mmserver=$(docker container inspect -f '{{ .NetworkSettings.IPAddress }}' mm01-docker)

while [[ "$(curl -s -o /dev/null -w ''%{http_code}'' $mmserver:8080)" != "200" ]]; do sleep 5; done


docker run --rm \
           -e DISPLAY \
           -e URL=$mmserver:8080 \
           -v /tmp/.X11-unix:/tmp/.X11-unix \
           --name mmclient \
           mmclient
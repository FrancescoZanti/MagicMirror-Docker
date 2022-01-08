#!/bin/bash

# FROM https://github.com/bastilimbach/docker-MagicMirror/blob/master/docker-entrypoint.sh

set -e

if [ ! "$(ls -A /opt/magic_mirror/modules)" ]; then
    cp -Rn /opt/default_modules/. /opt/magic_mirror/modules
fi

if [ ! "$(ls -A /opt/magic_mirror/config)" ]; then
    cp /opt/magic_mirror/mm-docker-config.js /opt/magic_mirror/config/config.js
fi

exec "$@"
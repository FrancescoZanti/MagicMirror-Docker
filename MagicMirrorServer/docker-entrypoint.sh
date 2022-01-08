#!/bin/bash

# FROM https://github.com/bastilimbach/docker-MagicMirror/blob/master/docker-entrypoint.sh

set -e

if [ ! "$(ls -A /opt/magic_mirror/modules)" ]; then
    cp -Rn /opt/default_modules/. /opt/magic_mirror/modules
fi

exec "$@"
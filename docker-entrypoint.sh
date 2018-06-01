#!/bin/bash
set -e

if [ "$1" = '/usr/bin/parsecd' ]; then
    echo $VIDEO_GID

    USER_UID=${USER_UID:-1000}
    USER_GID=${USER_GID:-1000}
    VIDEO_GID=${VIDEO_GID:-1000}

    echo $VIDEO_GID
    # create user group
    groupadd -f -g ${VIDEO_GID} video2
    #if ! getent group video >/dev/null; then
    #fi
    usermod -a -G video2 parsec

    exec su parsec -c "$@"
fi

exec "$@"

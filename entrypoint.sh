#!/bin/sh
if [ "$1" = 'youtrack' ]; then
    chown -R youtrack:youtrack "$YOUTRACK_HOME"
    echo "before run"
    exec su-exec "$@"
fi

exec "$@"
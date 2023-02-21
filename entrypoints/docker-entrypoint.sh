#!/bin/sh

set -e

if [ -f tmp/pids/server.pid ]; then
  rm tmp/pids/server.pid
fi

sudo mkdir -p log tmp && sudo chown user:user log tmp db
exec "$@"

#!/bin/sh

APP_NAME=$(basename $(pwd))

if [ $# -eq 0 ]
  then
    echo "Usage: run.sh [--run (-r), or --build (-b)]"
  else
    [[ "$@" =~ "--run" || "$@" =~ "-r" ]] && ( docker run -p 1812:1812 -p 1813:1813 --env-file ./vars.env -v "$(pwd)"/raddb/certs:/etc/raddb/certs --rm $APP_NAME )
    [[ "$@" =~ "--build" || "$@" =~ "-b" ]] && ( docker build --rm -t $APP_NAME:latest . )
fi

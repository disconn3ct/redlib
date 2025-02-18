#!/bin/sh

set -eu

if hash podman 2>/dev/null; then
  docker=podman
elif hash docker 2>/dev/null; then
  docker=docker
else
  echo "ERROR: Either podman or docker required."
  exit 1
fi

#<<<<<<< HEAD
#if [ -r .env ]; then
#  set -a
#  . "./.env"
#  set +a
#fi

#$docker build -t "${REGISTRY}/redlib:${1:-latest}" .

$docker build --build-arg=GIT_HASH="$(git rev-parse HEAD)" "$@" .

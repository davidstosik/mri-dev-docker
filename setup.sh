#!/usr/bin/env sh

IMAGE_NAME=mri_dev
VOLUME_NAME=mri_dev_vol

docker volume inspect $VOLUME_NAME > /dev/null 2>&1
if [ $? -eq 0 ]; then
  echo "Docker volume '$VOLUME_NAME' already exists, you may want to delete it first."
  exit 1
fi

docker image inspect $IMAGE_NAME > /dev/null 2>&1
if [ $? -eq 0 ]; then
  echo "Docker image '$IMAGE_NAME' already exists, you may want to delete it first."
  exit 1
fi

docker volume create $VOLUME_NAME
docker build -t $IMAGE_NAME .

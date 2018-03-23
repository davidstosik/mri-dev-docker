#!/usr/bin/env sh

IMAGE_NAME=mri_dev
VOLUME_NAME=mri_dev_vol

yn_question() {
  read -p "$1 [yN] " REPLY
  case "$REPLY" in
    y*|Y*) true ;;
    *) false ;;
  esac
}

docker volume inspect $VOLUME_NAME > /dev/null 2>&1
if [ $? -eq 0 ]; then
  echo "Docker volume '$VOLUME_NAME' already exists!"
  if yn_question "Do you want to delete it?"; then
    echo "Deleting Docker volume '$VOLUME_NAME'..."
    docker volume rm $VOLUME_NAME
  else
    echo "Aborted."
    exit 1
  fi
fi

docker image inspect $IMAGE_NAME > /dev/null 2>&1
if [ $? -eq 0 ]; then
  echo "Docker image '$IMAGE_NAME' already exists!"
  if yn_question "Do you want to delete it?"; then
    echo "Deleting Docker image '$IMAGE_NAME'..."
    docker rmi $IMAGE_NAME
  else
    echo "Aborted."
    exit 1
  fi
fi

docker volume create $VOLUME_NAME
docker build -t $IMAGE_NAME .

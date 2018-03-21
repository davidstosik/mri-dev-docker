#!/usr/bin/env sh

docker run \
  -it --rm \
  --mount src=mri_dev_vol,target=/workdir \
  --mount src=$PWD/ruby,target=/ruby,type=bind \
  mri_dev

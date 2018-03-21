#!/usr/bin/env sh

docker run \
  --cap-add=SYS_PTRACE \
  --security-opt seccomp=unconfined \
  -it --rm \
  --mount src=mri_dev_vol,target=/workdir \
  --mount src=$PWD/ruby,target=/ruby,type=bind \
  mri_dev

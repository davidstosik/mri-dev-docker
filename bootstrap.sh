#!/usr/bin/env sh

set -xe

git clone https://github.com/davidstosik/mri-dev-docker.git
git clone https://github.com/ruby/ruby.git mri-dev-docker/ruby
cd mri-dev-docker
./setup.sh

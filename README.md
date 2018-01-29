## Getting started

```sh
git clone https://github.com/davidstosik/mri-dev-docker.git mri_dev
cd mri_dev
git clone https://github.com/ruby/ruby.git
docker build -t mri_dev .
docker volume create mri_dev_vol
```

## Shell in Docker container

```sh
./start
```

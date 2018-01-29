## Getting started

```sh
git clone https://github.com/davidstosik/mri-dev-docker.git
cd mri-dev-docker
git clone https://github.com/ruby/ruby.git
docker volume create mri_dev_vol
docker build -t mri_dev .
```

## Shell in Docker container

In \*nix environments:

```sh
./start.sh
```

Else:

```sh
docker run -it --rm --mount src=mri_dev_vol,target=/mri_dev --mount src={current path}/ruby,target=/ruby,type=bind mri_dev
```

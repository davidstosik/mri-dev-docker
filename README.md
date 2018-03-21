## Requirements

- [Docker](https://www.docker.com/)
- `git`
- For the time being, documentation and scripts exists only for Unix shells.

## Getting started

You have two options to install: running the boostrap script or manually
following the install instructions.

### Bootstrap

You can get started by just pasting the following line in your command line:

```sh
curl -s https://raw.githubusercontent.com/davidstosik/mri-dev-docker/master/bootstrap.sh | sh /dev/stdin
```

### Manual

1. Clone this repository.
  ```sh
  git clone https://github.com/davidstosik/mri-dev-docker.git
  ```
2. Clone the Ruby source repository inside this repository.
  ```sh
  git clone https://github.com/ruby/ruby.git mri-dev-docker/ruby
  ```
  _You can also copy your own ruby source folder in `mri-dev-docker` if you
  already have it._

3. Run the setup script
  ```sh
  cd mri-dev-docker
  ./setup.sh
  ```

## Open console inside Docker container

```sh
./start.sh
```

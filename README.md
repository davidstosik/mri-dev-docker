# Ruby Hacker Box

## Purpose

The _Ruby Hacker Box_ is meant to make it easy for new Ruby hackers to get
started hacking Ruby very quickly.

It was started at [@ko1](https://github.com/ko1)'s [Ruby Hack
Challenge](https://github.com/ko1/rubyhackchallenge) and is based on the
documentation that was written for those events.

## Requirements

- [Docker](https://www.docker.com/)
- `git`
- For the time being, documentation and scripts exists only for Unix shells.

## Setup

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

## Getting started

You can open a Bash prompt in the Docker container you just built by using the
start script:

```sh
./start.sh
```

(This is just a shortcut to run the `docker run` command with the proper
options.)

The files are structured as described in [@ko1](https://github.com/ko1)'s [Build
MRI and install built
binaries](https://github.com/ko1/rubyhackchallenge/blob/master/EN/2_mri_structure.md#exercise-build-mri-and-install-built-binaries).

They are organised as follows:

```
/
├── ruby/
└── workdir/
    ├── build/
    ├── install/
    └── ruby -> /ruby
```

- `/ruby/` contains the Ruby source code, as a Docker volume mounted from the
  host's `ruby` directory that was checked out from GitHub during setup
- `/workdir/` is your working directory, containing:
  - the `build/` directory (`*.o` and other artifacts)
  - the `install/` directory (in which you can find the compiled `bin/ruby`)
  - a symbolic link to `/ruby`, for convenience

Once in the Docker's shell, you can start hacking Ruby, then use `make` to build
from the source, and for example, [run
tests](https://github.com/ko1/rubyhackchallenge/blob/master/EN/2_mri_structure.md#run-ruby-tests):

```sh
make btest
make test-all
make test-spec
```

You can also run `/ruby/test.rb` using `miniruby` with `make run`.

### About volumes

Note that `ruby/` is not mounted directly inside `/workdir` to allow Docker to
manage both directories as separate volumes, respectively mounted to your host
`ruby` directory, and to a Docker volume that will _backup_ build changes
between sessions.

Thanks to that, it is possible to hack at Ruby's source code from the host,
using your favorite tool suite. Build steps only will have to happen inside the
Docker container's shell.

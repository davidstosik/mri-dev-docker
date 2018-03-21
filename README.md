## Requirements

- [Docker](https://www.docker.com/)
- `git`
- For the time being, documentation and scripts exists only for Unix shells.

## Getting started

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

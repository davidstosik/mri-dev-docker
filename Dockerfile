FROM buildpack-deps:stretch

RUN set -ex; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
      bison \
      libgmp-dev \
      gdb \
      libjemalloc-dev \
      ruby

COPY ruby /ruby
WORKDIR /ruby
RUN ["autoconf"]

WORKDIR /mri_dev/build
RUN ["/ruby/configure", "--prefix=/mri_dev/install", "--enable-shared"]
RUN ["make", "all", "-j"]
RUN ["make", "install"]

VOLUME ["/mri_dev"]
VOLUME ["/ruby"]

CMD ["bash"]

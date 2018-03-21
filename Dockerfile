FROM buildpack-deps:stretch

RUN set -ex; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
      bison \
      libgmp-dev \
      gdb \
      libjemalloc-dev \
      ruby

ENV RUBY_SRC_DIR /ruby
ENV WORKDIR /mri_dev

COPY ruby $RUBY_SRC_DIR

WORKDIR $WORKDIR
RUN ln -s $RUBY_SRC_DIR

WORKDIR $RUBY_SRC_DIR
RUN autoconf

WORKDIR $WORKDIR/build
RUN $WORKDIR/ruby/configure --prefix=$WORKDIR/install --enable-shared
RUN make all -j
RUN make install

VOLUME $WORKDIR
VOLUME $RUBY_SRC_DIR

CMD bash

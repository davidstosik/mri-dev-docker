FROM buildpack-deps:stretch

ENV USERNAME rubydev
ENV RUBY_SRC_DIR /ruby
ENV WORKDIR /workdir

RUN set -ex; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
      bison \
      libgmp-dev \
      gdb \
      libjemalloc-dev \
      ruby

RUN useradd $USERNAME

RUN mkdir -p $WORKDIR/build
RUN chown -R $USERNAME:$USERNAME $WORKDIR

COPY ruby $RUBY_SRC_DIR
RUN chown -R $USERNAME:$USERNAME $RUBY_SRC_DIR

USER $USERNAME

RUN ln -s $RUBY_SRC_DIR $WORKDIR
COPY test.rb $RUBY_SRC_DIR

WORKDIR $WORKDIR/ruby
RUN autoconf

WORKDIR $WORKDIR/build
RUN $WORKDIR/ruby/configure --prefix=$WORKDIR/install --enable-shared
RUN make all -j
RUN make install

VOLUME $WORKDIR
VOLUME $RUBY_SRC_DIR

CMD bash

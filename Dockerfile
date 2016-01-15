FROM ubuntu:14.04.3

RUN apt-get update
RUN apt-get install -q -y --force-yes git build-essential
RUN apt-get install -q -y --force-yes autoconf

# Build from source
RUN mkdir -p /code
RUN git clone https://github.com/twitter/fatcache.git /code/fatcache
WORKDIR /code/fatcache
RUN git checkout d8a0ed5 # specific commit
RUN autoreconf -fvi
#RUN ./configure --enable-debug=log
RUN ./configure --enable-debug=no
RUN make
ENV PATH /code/fatcache/src:$PATH

EXPOSE 11211
ENTRYPOINT ["fatcache", "-p", "11211", "--slab-size", "10", "--ssd-device=/dev/xvda"]

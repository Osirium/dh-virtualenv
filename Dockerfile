FROM ubuntu:trusty

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update \
    && apt-get --quiet --yes --no-install-recommends install \
      build-essential \
      ca-certificates \
      curl \
      debhelper \
      dh-virtualenv \
      python-dev \
      python-sphinx \
      python-mock \
      ;

WORKDIR /build

ADD https://github.com/spotify/dh-virtualenv/archive/1.0.tar.gz /build/dh-virtualenv_1.0.orig.tar.gz

RUN tar xvpzf dh-virtualenv_1.0.orig.tar.gz

WORKDIR /build/dh-virtualenv-1.0

VOLUME /out

CMD dpkg-buildpackage -us -uc && cp /build/dh-virtualenv_1.0-1_all.deb /out/

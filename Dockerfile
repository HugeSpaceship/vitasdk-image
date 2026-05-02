FROM ubuntu:24.04

RUN apt-get update
RUN apt-get install -y make git cmake python3 curl sudo wget bzip2 xz-utils build-essential autoconf texinfo bison flex libtool

ENV VITASDK=/usr/local/vitasdk
ENV PATH=/usr/local/vitasdk/bin:$PATH

WORKDIR /opt
RUN git clone https://github.com/vitasdk/vdpm
WORKDIR /opt/vdpm
# Get ancient vitasdk as the latest has issues due to being on GCC 15
RUN wget 'https://github.com/vitasdk/autobuilds/releases/download/master-linux-v2.535/vitasdk-x86_64-linux-gnu-2025-07-20_13-03-36.tar.bz2' | tar xj -C $VITASDK --strip-components=1
RUN /opt/vdpm/install-all.sh

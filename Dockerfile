FROM ubuntu:24.04

RUN apt-get update
RUN apt-get install -y make git-core cmake python3 curl sudo wget bzip2 xz-utils

ENV VITASDK=/usr/local/vitasdk
ENV PATH=/usr/local/vitasdk/bin:$PATH

WORKDIR /opt
RUN git clone https://github.com/vitasdk/vdpm
WORKDIR /opt/vdpm
RUN /opt/vdpm/bootstrap-vitasdk.sh
RUN /opt/vdpm/install-all.sh
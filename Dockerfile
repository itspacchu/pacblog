FROM alpine:latest

LABEL email="prashantn@riseup.net"

ARG GIT_URL https://github.com/itspacchu/pacblog
ENV GIT_URL ${GIT_URL}

RUN apk add git hugo
RUN mkdir /workdir /export
WORKDIR /workdir

RUN git clone --recurse-submodules ${GIT_URL} ./
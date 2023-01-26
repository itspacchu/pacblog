FROM alpine:latest

LABEL email="prashantn@riseup.net"

ENV GIT_URL https://github.com/itspacchu/pacblog

RUN apk add git hugo
RUN mkdir /workdir /export
WORKDIR /workdir

RUN git clone --recurse-submodules ${GIT_URL} ./
RUN hugo --destination /export
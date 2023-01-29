FROM nginx:latest

LABEL maintainer="prashantn@riseup.net"
LABEL name="Nandipati Prashant"

ENV GIT_URL="https://github.com/itspacchu/pacblog"


RUN apt update && apt upgrade && apt install git hugo -y

WORKDIR /runtime

RUN git clone --recurse-submodules  ${GIT_URL} .  && \
    curl -o /etc/nginx/nginx.conf "https://gist.githubusercontent.com/itspacchu/bda611d49efe8c3d534a6a22f5acb972/raw/e32acaf9361fa9716c3672d50d556fe090ffc6b0/nginx.conf" && \
    hugo && cp -r ./public/* /usr/share/nginx/html

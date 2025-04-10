FROM docker.io/library/nginx

LABEL maintainer="prashantn@riseup.net"
LABEL name="Nandipati Prashant"

ENV GIT_URL="https://github.com/itspacchu/pacblog"

RUN apt update && apt upgrade -y && apt install wget git -y

RUN wget https://github.com/gohugoio/hugo/releases/download/v0.131.0/hugo_0.131.0_linux-$(dpkg --print-architecture).deb

RUN dpkg -i hugo_0.131.0_linux-$(dpkg --print-architecture).deb  

WORKDIR /runtime

RUN git clone --recurse-submodules  ${GIT_URL} .

RUN git pull origin

COPY ./nginx/nginx.conf ./nginx.conf

RUN cp ./nginx.conf /etc/nginx/nginx.conf

RUN hugo

RUN cp -r ./public/* /usr/share/nginx/html

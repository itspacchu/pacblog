FROM nginx:bookworm

LABEL maintainer="prashantn@riseup.net"
LABEL name="Nandipati Prashant"

ENV GIT_URL="https://github.com/itspacchu/pacblog"

RUN apt update && apt upgrade -y && apt install wget git -y && wget https://github.com/gohugoio/hugo/releases/download/v0.121.0/hugo_0.121.0_linux-$(dpkg --print-architecture).deb && dpkg -i hugo_0.121.0_linux-$(dpkg --print-architecture).deb  

WORKDIR /runtime

RUN git clone --recurse-submodules  ${GIT_URL} .

RUN curl -o /etc/nginx/nginx.conf "https://gist.githubusercontent.com/itspacchu/bda611d49efe8c3d534a6a22f5acb972/raw/e32acaf9361fa9716c3672d50d556fe090ffc6b0/nginx.conf"

RUN hugo

RUN cp -r ./public/* /usr/share/nginx/html

RUN mkdir -p /usr/share/nginx/html/cdn

RUN curl https://gist.githubusercontent.com/itspacchu/84acb941e1bb4c460d241db19c1db3e3/raw/34235845d306bfc0bbf1f3a21a4bfd04da4f4c19/resumebase64 | base64 -d >> /usr/share/nginx/html/cdn/resume.pdf



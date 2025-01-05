FROM docker.io/library/nginx:bookworm

LABEL maintainer="prashantn@riseup.net"
LABEL name="Nandipati Prashant"

ENV GIT_URL="https://github.com/itspacchu/pacblog"

RUN apt update && apt upgrade -y && apt install wget git -y

RUN wget https://github.com/gohugoio/hugo/releases/download/v0.131.0/hugo_0.131.0_linux-$(dpkg --print-architecture).deb

RUN dpkg -i hugo_0.121.0_linux-$(dpkg --print-architecture).deb  

WORKDIR /runtime

RUN git clone --recurse-submodules  ${GIT_URL} .

RUN git pull origin

#RUN curl -o /etc/nginx/nginx.conf "https://gist.githubusercontent.com/itspacchu/bda611d49efe8c3d534a6a22f5acb972/raw/e32acaf9361fa9716c3672d50d556fe090ffc6b0/nginx.conf"

COPY ./nginx/nginx.conf ./nginx.conf

RUN cp ./nginx.conf /etc/nginx/nginx.conf

RUN hugo

RUN cp -r ./public/* /usr/share/nginx/html

RUN mkdir -p /usr/share/nginx/html/cdn

RUN curl https://gist.githubusercontent.com/itspacchu/84acb941e1bb4c460d241db19c1db3e3/raw/54893a4f707ddac5397ab799424ff569a28092e1/resumebase64 | base64 -d >> /usr/share/nginx/html/cdn/resume.pdf



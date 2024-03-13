FROM nginx:bookworm

LABEL maintainer="prashantn@riseup.net"
LABEL name="Nandipati Prashant"

ENV GIT_URL="https://github.com/itspacchu/pacblog"

RUN apt update && apt upgrade -y && apt install wget git -y && wget https://github.com/gohugoio/hugo/releases/download/v0.110.0/hugo_0.110.0_linux-$(dpkg --print-architecture).deb && dpkg -i hugo_0.110.0_linux-$(dpkg --print-architecture).deb  

WORKDIR /runtime

RUN git clone --recurse-submodules  ${GIT_URL} .  && \
    curl -o /etc/nginx/nginx.conf "https://gist.githubusercontent.com/itspacchu/bda611d49efe8c3d534a6a22f5acb972/raw/e32acaf9361fa9716c3672d50d556fe090ffc6b0/nginx.conf" && \
    hugo && cp -r ./public/* /usr/share/nginx/html

RUN curl -L --output cloudflared.deb https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-arm64.deb && dpkg -i cloudflared.deb && cloudflared service install ${CLOUDFLARED_SECRET}



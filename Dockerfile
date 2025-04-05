FROM nginx:alpine

LABEL maintainer="prashantn@riseup.net"
LABEL name="Nandipati Prashant"

COPY ./nginx/nginx.conf /etc/nginx/nginx.conf

COPY ./public/ /usr/share/nginx/html

RUN wget -O favicon.png https://github.com/itspacchu.png
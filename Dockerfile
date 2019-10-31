FROM node:8.16-alpine

RUN apk upgrade --update \
 && apk add -t build-dependencies \
    build-base \
 && apk add \
    openssl \
    ca-certificates \
    git \
 && git clone https://github.com/luchenqun/my-bookmark.git /opt/my-bookmark \
 && apk del build-dependencies \
 && rm -rf /tmp/* /var/cache/apk/*

WORKDIR /opt/my-bookmark

RUN npm install \
 && npm install -g pm2 \
 && cp config.default.js config.js

VOLUME /opt/my-bookmark

EXPOSE 2000

CMD pm2 /opt/my-bookmark/start bin/www -i 0 && pm2 save && pm2 startup

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

RUN npm install

VOLUME /opt

EXPOSE 8080 80 443

CMD npm run build

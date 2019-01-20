FROM node:10-alpine AS builder

WORKDIR /app

COPY ./package.json ./package-lock.json ./

RUN npm i

COPY ./angular.json ./tslint.json ./tsconfig.json ./
COPY ./src/ ./src/

RUN ./node_modules/.bin/ng build --prod

FROM nginx:alpine

RUN apk add -U gomplate apache2-utils && rm -rf /var/cache/apk/*

COPY --from=builder /app/dist/grin-wallet/* /usr/share/nginx/html

COPY ./etc/entrypoint.sh /
COPY ./etc/nginx.conf.gotmpl /nginx.conf.gotmpl

ENV WALLET_READONLY=true
ENV WALLET_OWNER_API_URL=

ENTRYPOINT ["/entrypoint.sh"]

FROM hugomods/hugo:exts AS builder

WORKDIR /src
COPY . .

RUN hugo --minify
RUN ls -la /src/public

FROM nginx:alpine

RUN rm -rf /usr/share/nginx/html/*

COPY --from=builder /src/public/ /usr/share/nginx/html/

RUN ls -la /usr/share/nginx/html

EXPOSE 80

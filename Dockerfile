FROM hugomods/hugo:exts AS builder

WORKDIR /src
COPY . .

# force la bonne version Go 
ENV GOTOOLCHAIN=local

RUN hugo --minify

FROM nginx:alpine

RUN rm -rf /usr/share/nginx/html/*

COPY --from=builder /src/public/ /usr/share/nginx/html/

EXPOSE 80

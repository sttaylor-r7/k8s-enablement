FROM alpine:latest
RUN apk add --no-cache nginx
RUN adduser -D www
RUN mkdir /www
RUN chown -R www:www-data /www
COPY nginx.conf /etc/nginx/nginx.conf
COPY html/* /www
ENTRYPOINT ["nginx", "-g", "daemon off;"]
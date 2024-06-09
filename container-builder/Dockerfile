FROM alpine:latest
RUN apk add --no-cache nginx
RUN mkdir /www
RUN chown -R www:www /www
COPY nginx.conf /etc/nginx.conf
COPY html/* /www
ENTRYPOINT ["nginx", "-g", "daemon off"]

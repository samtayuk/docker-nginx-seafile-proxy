FROM alpine:3.5

ADD nginx.conf /app/

# Download and install nginx
RUN apk --no-cache --no-progress add ca-certificates nginx bash && \
    update-ca-certificates && \
    ln -sf /dev/stdout /var/log/nginx/access.log && \
    ln -sf /dev/stderr /var/log/nginx/error.log

EXPOSE 80

CMD ["nginx" "-c" "/app/nginx.conf"]

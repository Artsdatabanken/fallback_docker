FROM artsdatabanken/httpd
ARG TZ='Europe/Berlin'
ENV DEFAULT_TZ ${TZ}
RUN apk upgrade --update \
  && apk add -U tzdata \
  && cp /usr/share/zoneinfo/${DEFAULT_TZ} /etc/localtime \
  && apk del tzdata \
  && rm -rf \
  /var/cache/apk/*

WORKDIR /usr/local/apache2/htdocs
COPY . .
EXPOSE 3001
CMD ["httpd-foreground"]
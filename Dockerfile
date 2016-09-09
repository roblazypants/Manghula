FROM httpd:alpine

MAINTAINER http://www.redpine.com

#RUN apk add --update mod_ssl 
RUN apk add --update mailx ssmtp  php5 && \
    apk update && apk upgrade && \
    apk add curl openssl && \
    apk add php5 php5-apache2 php5-openssl && \
    apk add php5-fpm php5-cli php5-mysql php5-pgsql php5-sqlite3 php5-phar && \
    apk add php5-apcu php5-intl php5-imagick php5-mcrypt php5-json php5-gd php5-curl && \
    cd /tmp && curl -sS https://getcomposer.org/installer | php && mv composer.phar /usr/local/bin/composer&& \
    rm -rf /var/cache/apk/*

ADD httpd-ssl.conf   /usr/local/apache2/conf/extra/httpd-ssl.conf
COPY httpd.conf /usr/local/apache2/conf/
COPY index.html /usr/local/apache2/htdocs/
COPY error.html /usr/local/apache2/htdocs/
COPY ajax.php   /usr/local/apache2/htdocs/
COPY config.php /usr/local/apache2/htdocs/
COPY crossdomain.xml /usr/local/apache2/htdocs/
COPY ssmtp.conf /etc/ssmtp/

ADD img /usr/local/apache2/htdocs/img
ADD css /usr/local/apache2/htdocs/css
ADD js  /usr/local/apache2/htdocs/js

RUN mkdir /etc/pki

VOLUME ["/etc/pki"]

ENV TERM=xterm

EXPOSE 443


FROM httpd:alpine

MAINTAINER http://www.redpine.com

#RUN apk add --update mod_ssl 

ADD httpd-ssl.conf   /usr/local/apache2/conf/extra/httpd-ssl.conf
COPY httpd.conf /usr/local/apache2/conf/
COPY index.html /usr/local/apache2/htdocs/
COPY error.html /usr/local/apache2/htdocs/
COPY ajax.php   /usr/local/apache2/htdocs/
COPY config.php /usr/local/apache2/htdocs/

ADD img /usr/local/apache2/htdocs/img
ADD css /usr/local/apache2/htdocs/css
ADD js  /usr/local/apache2/htdocs/js

RUN mkdir /etc/pki

ENV TERM=xterm

EXPOSE 443


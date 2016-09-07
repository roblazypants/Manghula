FROM httpd:alpine

MAINTAINER http://www.redpine.com

#RUN apk add --update mod_ssl 
RUN apk add --update mailx ssmtp  php5 && \
	apk add --update \
		php5-mcrypt \
		php5-soap \
		php5-openssl \
		php5-gmp \
		php5-pdo_odbc \
		php5-json \
		php5-dom \
		php5-pdo \
		php5-zip \
		php5-mysql \
		php5-sqlite3 \
		php5-apcu \
		php5-pdo_pgsql \
		php5-bcmath \
		php5-gd \
		php5-xcache \
		php5-odbc \
		php5-pdo_mysql \
		php5-pdo_sqlite \
		php5-gettext \
		php5-xmlreader \
		php5-xmlrpc \
		php5-bz2 \
		php5-memcache \
		php5-mssql \
		php5-iconv \
		php5-pdo_dblib \
		php5-curl \
		php5-ctype \
		php5-phar \
		php5-cli 

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


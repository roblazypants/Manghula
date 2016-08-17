FROM centos/httpd
MAINTAINER http://www.redpine.com

RUN yum -y update && yum -y install mod_ssl mail sendmail && yum clean all

COPY ssl.conf   /etc/httpd/conf.d/
COPY index.html /var/www/html/
COPY error.html /var/www/html/
COPY ajax.php   /var/www/html/
COPY config.php /var/www/html/

ADD img /var/www/html/img
ADD css /var/www/html/css
ADD js  /var/www/html/js

EXPOSE 443


FROM centos/httpd
MAINTAINER http://www.redpine.com

RUN yum -y update && yum -y install mod_ssl mail sendmail && yum clean all

COPY ssl.conf /etc/httpd/conf.d/ && \
     index.html /var/www/html/ && \
     error.html /var/www/html/ && \
     ajax.php   /var/www/html/ && \
     config.php /var/www/html/

ADD img /var/www/html/img && \
    css /var/www/html/css && \
    js  /var/www/html/js

EXPOSE 443


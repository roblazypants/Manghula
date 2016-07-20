FROM centos:latest
MAINTAINER http://www.centos.org
LABEL Vendor="CentOS"
LABEL License=GPLv2
LABEL Version=2.4.6-31

RUN yum -y update && yum clean all
RUN yum -y install httpd && yum clean all

COPY resources /usr/local/docker/certs.tar /
tar -xvf certs.tar /

ADD index.html /var/www/html
ADD error.html /var/www/html

EXPOSE 80
EXPOSE 443

# Simple startup script to avoid some issues observed with container restart
ADD run-httpd.sh /run-httpd.sh
RUN chmod -v +x /run-httpd.sh

CMD ["/run-httpd.sh"]

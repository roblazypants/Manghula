FROM centos/httpd
MAINTAINER http://www.redpine.com

RUN yum -y install mod_ssl && yum clean all

COPY Manghula.tar /
RUN tar -xvf Manghula.tar

COPY index.html /var/www/html/
COPY error.html /var/www/html/

EXPOSE 443


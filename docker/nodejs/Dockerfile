FROM centos

MAINTAINER Daniel Brown <danrb@redpine.com>

RUN rpm -Uvh https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
RUN yum clean all
RUN rpm --rebuilddb

RUN yum -y install nodejs npm
RUN mkdir /usr/local/node

WORKDIR /usr/local/node

COPY main.js /usr/local/node/

EXPOSE 8081 

CMD node main.js

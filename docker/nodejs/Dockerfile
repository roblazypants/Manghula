FROM centos

MAINTAINER Daniel Brown <danrb@redpine.com>

RUN rpm -Uvh https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm && \
    yum clean all && \ 
    rpm --rebuilddb

RUN yum -y install nodejs npm && \
    npm install -g nodemon
    
RUN mkdir /usr/local/node/

#copy certs from Jenkins work directory
COPY Manghula.tar /
RUN tar -xvf /Manghula.tar


COPY . /usr/local/node/
RUN npm install

EXPOSE 80 
EXPOSE 443

WORKDIR /usr/local/node


RUN node app.js
CMD npm start

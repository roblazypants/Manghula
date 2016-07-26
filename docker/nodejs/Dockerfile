FROM centos

MAINTAINER Daniel Brown <danrb@redpine.com>

RUN rpm -Uvh https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm && \
    yum clean all && \ 
    rpm --rebuilddb

RUN yum -y install nodejs npm && \
    npm install -g nodemon && \
    mkdir /usr/local/node

WORKDIR /usr/local/node

#copy certs from Jenkins work directory
COPY Manghula.tar /usr/local/node
RUN tar -xvf Manghula.tar


ADD app.js /usr/local/node/ && \
    bin /usr/local/node/bin && \
    public /usr/local/node/public && \
    routes /usr/local/node/routes && \
    views /usr/local/node/views

COPY package.json /usr/local/node/
RUN npm install

EXPOSE 80 
EXPOSE 443

RUN node app.js
CMD npm start

FROM centos

MAINTAINER Daniel Brown <danrb@redpine.com>

RUN rpm -Uvh https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
RUN yum clean all
RUN rpm --rebuilddb

RUN yum -y install nodejs npm
RUN npm install -g nodemon
RUN mkdir /usr/local/node

WORKDIR /usr/local/node

COPY main.js /usr/local/node/
COPY app.js /usr/local/node/
COPY package.json /usr/local/node/
ADD bin /usr/local/node/bin
ADD public /usr/local/node/public
ADD routes /usr/local/node/routes
ADD views /usr/local/node/views
RUN npm install

EXPOSE 8081 3000

RUN node app.js
CMD npm start

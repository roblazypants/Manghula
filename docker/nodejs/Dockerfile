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
COPY bin /usr/local/node/
COPY node_modules /usr/local/node/
COPY public /usr/local/node/
COPY routes /usr/local/node/
COPY views /usr/local/node/
RUN npm install

EXPOSE 8081 3000

CMD node app.js

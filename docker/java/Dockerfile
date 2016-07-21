FROM centos

RUN yum install -y curl
RUN yum install -y unzip

#Java8
ENV JDK_VERSION 8u102
ENV JDK_BUILD_VERSION b14
ENV JDK_PATH /usr/java/jdk1.8.0_102
RUN \
	curl -LO "http://download.oracle.com/otn-pub/java/jdk/8u102-b14/jdk-8u102-linux-x64.rpm" -H 'Cookie: oraclelicense=accept-securebackup-cookie' && \
	rpm -i jdk-8u102-linux-x64.rpm && \
	rm -f jdk-8u102-linux-x64.rpm && \
	yum clean all

# Install the Java JCE Policy
RUN curl -q -L -C - -b "oraclelicense=accept-securebackup-cookie" -o /tmp/jce_policy-8.zip -O http://download.oracle.com/otn-pub/java/jce/8/jce_policy-8.zip \
    && unzip -oj -d /usr/java/jdk1.8.0_102/jre/lib/security /tmp/jce_policy-8.zip \*/\*.jar \
    && rm /tmp/jce_policy-8.zip

ENV JAVA_HOME /usr/java/default

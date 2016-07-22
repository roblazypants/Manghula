FROM 442977304635.dkr.ecr.us-east-1.amazonaws.com/java8:latest

RUN yum -y install wget

ENV JAVA_HOME /usr/java
ENV CATALINA_HOME /opt/tomcat 
ENV PATH $PATH:$JAVA_HOME/bin:$CATALINA_HOME/bin:$CATALINA_HOME/scripts

RUN groupadd tomcat
RUN useradd -M -s /bin/nologin -g tomcat -d /opt/tomcat tomcat

RUN wget http://apache.mirrors.tds.net/tomcat/tomcat-8/v8.5.4/bin/apache-tomcat-8.5.4.tar.gz
RUN mkdir $CATALINA_HOME
RUN tar xvf apache-tomcat-8*tar.gz -C $CATALINA_HOME --strip-components=1

RUN cd $CATALINA_HOME
RUN chmod +x ${CATALINA_HOME}/bin/*sh

RUN groupadd -r tomcat && \
	useradd -g tomcat -d ${CATALINA_HOME} -s /sbin/nologin  -c "Tomcat user" tomcat && \
	chown -R tomcat:tomcat ${CATALINA_HOME}

EXPOSE 8080 
#EXPOSE 8009

WORKDIR $CATALINA_HOME
USER tomcat
CMD ["catalina.sh","start"]

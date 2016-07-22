FROM 442977304635.dkr.ecr.us-east-1.amazonaws.com/java8:latest

RUN yum -y install wget

ENV JAVA_HOME /usr/java/default
ENV CATALINA_HOME /opt/tomcat 
ENV PATH $PATH:$JAVA_HOME/bin:$CATALINA_HOME/bin:$CATALINA_HOME/scripts

RUN wget http://apache.mirrors.tds.net/tomcat/tomcat-8/v8.5.4/bin/apache-tomcat-8.5.4.tar.gz && \
    mkdir $CATALINA_HOME && \
    tar xvf apache-tomcat-8*tar.gz -C $CATALINA_HOME --strip-components=1

RUN cd $CATALINA_HOME && \
    chmod +x ${CATALINA_HOME}/bin/*sh && \
    groupadd -r tomcat && \
    useradd -g tomcat -d ${CATALINA_HOME} -s /sbin/nologin  -c "Tomcat user" tomcat && \
    chown -R tomcat:tomcat ${CATALINA_HOME}

EXPOSE 8080 
#EXPOSE 8009

WORKDIR $CATALINA_HOME
USER tomcat
CMD $CATALINA_HOME/bin/catalina.sh run

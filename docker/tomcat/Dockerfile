FROM 442977304635.dkr.ecr.us-east-1.amazonaws.com/manghulawebapp/java8 


ENV CATALINA_HOME /opt/tomcat 
ENV PATH $PATH:$JAVA_HOME/bin:$CATALINA_HOME/bin:$CATALINA_HOME/scripts

RUN wget http://apache-mirror.rbc.ru/pub/apache/tomcat/tomcat-8/v8.0.15/bin/apache-tomcat-8.0.15.tar.gz && \
	tar -xvf apache-tomcat-8.0.15.tar.gz && \
	rm apache-tomcat*.tar.gz && \
	mv apache-tomcat* ${CATALINA_HOME} 

RUN chmod +x ${CATALINA_HOME}/bin/*sh

# Disable Tomcat's manager application.
RUN rm -rf webapps/*

# Create tomcat user and group
RUN groupadd tomcat \
	&& useradd -g tomcat tomcat

# Change permissions on tomcat directories
RUN chgrp -R tomcat . \
	&& chmod -R g+r . \
	&& chmod g+w conf logs temp webapps work

EXPOSE 8080 EXPOSE 8009


USER tomcat

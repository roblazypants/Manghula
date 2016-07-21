FROM 442977304635.dkr.ecr.us-east-1.amazonaws.com/manghulawebapp/java8 


ENV CATALINA_HOME /opt/tomcat 
ENV PATH $PATH:$JAVA_HOME/bin:$CATALINA_HOME/bin:$CATALINA_HOME/scripts

RUN yum -y install tomcat

EXPOSE 8080 EXPOSE 8009


USER tomcat

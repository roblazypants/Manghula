FROM 442977304635.dkr.ecr.us-east-1.amazonaws.com/java8:latest

RUN yum install wget

ENV CATALINA_HOME /usr/share/tomcat
ENV PATH $PATH:$JAVA_HOME/bin:$CATALINA_HOME/bin:$CATALINA_HOME/scripts

RUN groupadd tomcat
RUN useradd -M -s /bin/nologin -g tomcat -d /opt/tomcat tomcat

RUN wget http://apache.mirrors.tds.net/tomcat/tomcat-8/v8.5.4/bin/apache-tomcat-8.5.4.tar.gz
RUN mkdir /opt/tomcat
RUN tar xvf apache-tomcat-8*tar.gz -C /opt/tomcat --strip-components=1

RUNcd /opt/tomcat
RUN chgrp -R tomcat conf
RUN chmod g+rwx conf
RUN chmod g+r conf/*
RUN chown -R tomcat webapps/ work/ temp/ logs/

RUN echo $'# Systemd unit file for tomcat \n\
[Unit] \n\
Description=Apache Tomcat Web Application Container\n\
After=syslog.target network.target\n\n\
[Service] \n\
Type=forking \n\n\
Environment=JAVA_HOME=/usr/lib/jvm/jre \n\
Environment=CATALINA_PID=/opt/tomcat/temp/tomcat.pid \n\
Environment=CATALINA_HOME=/opt/tomcat \n\
Environment=CATALINA_BASE=/opt/tomcat \n\
Environment=\'CATALINA_OPTS=-Xms512M -Xmx1024M -server -XX:+UseParallelGC\' \n\
Environment=\'JAVA_OPTS=-Djava.awt.headless=true -Djava.security.egd=file:/dev/./urandom\' \n\n\
ExecStart=/opt/tomcat/bin/startup.sh \n\
ExecStop=/bin/kill -15 $MAINPID \n\n\
User=tomcat \n\
Group=tomcat\n\n\
[Install]\n\
WantedBy=multi-user.target' >  /etc/systemd/system/tomcat.service

EXPOSE 8080 
#EXPOSE 8009

RUN systemctl daemon-reload
RUN systemctl enable tomcat

USER tomcat
CMD ["systemctl daemon-reload"]

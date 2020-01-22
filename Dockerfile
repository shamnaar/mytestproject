FROM centos
WORKDIR /opt/tomcat
RUN curl -O http://mirrors.estointernet.in/apache/tomcat/tomcat-8/v8.5.50/bin/apache-tomcat-8.5.50.tar.gz
RUN tar xzvf apache-tomcat-8.5.50.tar.gz 
RUN mv apache-tomcat-8.5.50/* /opt/tomcat/.
RUN chmod +x /opt/tomcat/bin/*.sh
RUN yum install java -y
RUN java -version
EXPOSE 8080
CMD ["/opt/tomcat/bin/catalina.sh", "run"]

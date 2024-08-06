FROM quay.io/centos/centos:stream9

LABEL maintainer="gmf86@icloud.com"

RUN dnf install -y java-11-openjdk && dnf clean all

RUN mkdir /opt/tomcat

RUN curl -O https://dlcdn.apache.org/tomcat/tomcat-8/v8.5.100/bin/apache-tomcat-8.5.100.tar.gz && tar xvfz apache*.tar.gz && mv apache-tomcat-8.5.100/* /opt/tomcat/.

ADD todo.war /opt/tomcat/webapps/

EXPOSE 8080
CMD ["/opt/tomcat/bin/catalina.sh", "run"]

From tomcat:8.5.47-jdk8-openjdk
ADD target/addressbook.war  /usr/local/tomcat/webapps
EXPOSE 8080

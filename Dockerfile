FROM tomcat:9.0

COPY /target/onlinebookstore-0.0.1-SNAPSHOT.war /usr/local/tomcat/webapps/

EXPOSE 8080

ENTRYPOINT ["catalina.sh", "run"]
# java -jar onlinebookstore-0.0.1-SNAPSHOT.war

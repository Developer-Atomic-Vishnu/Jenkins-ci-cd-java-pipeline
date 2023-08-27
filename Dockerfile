FROM openjdk:11-jre-slim

WORKDIR /app

COPY /target/onlinebookstore-0.0.1-SNAPSHOT.war /app/

EXPOSE 8080

ENTRYPOINT [ "java" , "-jar" , "/target/onlinebookstore-0.0.1-SNAPSHOT.war" ]
# java -jar onlinebookstore-0.0.1-SNAPSHOT.war

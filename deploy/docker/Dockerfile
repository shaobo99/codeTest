#FROM jdk:8
#VOLUME /tmp
#ADD ../../lib/xiaobo_demo1-1.0-SNAPSHOT.jar app.jar
#EXPOSE 8888
#ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/app.jar","--spring.profiles.active=prd"]

FROM openjdk:8

COPY *.jar /app.jar

CMD ["--server.port=8888"]

EXPOSE 8888

ENTRYPOINT ["java", "-jar", "/app.jar"]

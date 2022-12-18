FROM adoptopenjdk/openjdk11
USER root
HEALTHCHECK NONE
RUN mkdir -p /application
COPY target/*.jar /application/gateway-service.jar
ENTRYPOINT ["/bin/sh", "-c", "java -Duser.timezone=GMT -jar /application/gateway-service.jar"]
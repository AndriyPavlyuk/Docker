# syntax=docker/dockerfile:experimental
FROM maven as build

COPY pom.xml /opt/pom.xml
COPY src /opt/src
WORKDIR /opt
RUN --mount=type=cache,target=/root/.m2 mvn install spring-boot:repackage

FROM openjdk:15-alpine
COPY --from=build /opt/target/spring-boot-docker.jar /app.jar
ENV JAVA_OPTS=""
ENTRYPOINT [ "sh", "-c", "java $JAVA_OPTS -Djava.security.egd=file:/dev/./urandom -jar /app.jar" ]


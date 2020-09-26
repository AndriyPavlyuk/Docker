FROM maven as build

COPY pom.xml /opt/pom.xml
WORKDIR /opt

RUN mvn dependency:resolve
COPY src /opt/src
RUN mvn install spring-boot:repackage

FROM openjdk:15-alpine
COPY --from=build /opt/target/spring-boot-docker.jar /app.jar
ENV JAVA_OPTS=""
ENTRYPOINT [ "sh", "-c", "java $JAVA_OPTS -Djava.security.egd=file:/dev/./urandom -jar /app.jar" ]


FROM openjdk:14-alpine

LABEL Author="Sergiy Morenets"

COPY MainStarter.java /sources/
COPY mysql-connector-java-8.0.19.jar /sources/

WORKDIR /sources
RUN javac MainStarter.java && rm MainStarter.java

FROM openjdk:alpine

LABEL Author="Sergiy Morenets"

COPY MainStarter.java /sources/
COPY mysql-connector-java-8.0.19.jar /sources/

WORKDIR /sources
RUN javac MainStarter.java && rm MainStarter.java

CMD java -classpath .:/sources/mysql-connector-java-8.0.19.jar MainStarter
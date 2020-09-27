# syntax=docker/dockerfile:experimental
#FROM maven as base
#
#COPY pom.xml /opt/pom.xml
#COPY src /opt/src
#WORKDIR /opt
#RUN --mount=type=cache,target=/root/.m2 mvn install spring-boot:repackage

FROM oracle/graalvm-ce:20.1.0-java11 as graalvm

RUN gu install native-image

#COPY --from=base /opt/target/docker-task15-1.0.jar /opt/app.jar
COPY target/docker-task15-1.0.jar /opt/app.jar

WORKDIR /opt

RUN jar -xvf /opt/app.jar 

RUN cp -R META-INF BOOT-INF/classes
RUN export LIBPATH=`find BOOT-INF/lib | tr '\n' ':'` && \
    export CP=BOOT-INF/classes:$LIBPATH  && \
    native-image --verbose \
       -H:EnableURLProtocols=http \
       -H:Name=spring-graalvm \
       -Dspring.native.remove-yaml-support=true \
       -Dspring.native.remove-jmx-support=true \
       -Dspring.xml.ignore=true \
       -Dspring.spel.ignore=true \
       -cp $CP it.discovery.MainApplication

FROM ubuntu
# TODO use alpine instead

COPY --from=graalvm /spring-graalvm /spring-graalvm

CMD ./spring-graalvm
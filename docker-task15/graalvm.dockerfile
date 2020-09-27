FROM openjdk:alpine as jdk

#Copy and compile HelloWorld.java
COPY src/main/java/HelloWorld.java /sources/
WORKDIR /sources
RUN javac HelloWorld.java

FROM oracle/graalvm-ce:20.1.0-java11 as graalvm

RUN gu install native-image

COPY --from=jdk /sources/HelloWorld.class /

RUN native-image HelloWorld

FROM ubuntu

COPY --from=graalvm /helloworld /helloworld

CMD ./helloworld

FROM openjdk:alpine as jdk

#Copy and compile HelloWorld.java

FROM oracle/graalvm-ce:20.1.0-java11

RUN gu install native-image

COPY --from=jdk /sources/HelloWorld.class /

RUN native-image HelloWorld

CMD ./helloworld
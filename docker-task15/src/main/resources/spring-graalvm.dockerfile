FROM maven as base

#Copy project and build it using Maven

FROM oracle/graalvm-ce:20.1.0-java11

RUN gu install native-image

COPY --from=base /opt/target/docker-task15-1.0.jar /opt/app.jar

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

CMD ./spring-graalvm
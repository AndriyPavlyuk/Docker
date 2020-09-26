FROM openjdk

LABEL Author="Sergiy Morenets"

COPY src/main/java/Sample.java /sources/
WORKDIR /sources
RUN javac Sample.java && rm Sample.java

CMD java Sample
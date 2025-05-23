FROM openjdk:11
COPY HelloWorld.java /
RUN javac HelloWorld.java
CMD ["java", "HelloWorld"]

FROM openjdk:11-windowsservercore

LABEL maintainer="chi-fu.wang@utsouthwestern.edu"

COPY target/springbootdemo.jar /springbootdemo.jar
EXPOSE 8080

CMD ["java", "-jar", "springbootdemo.jar"]

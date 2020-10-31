FROM privaterepo:18082/aisopenjdk11:latest

LABEL maintainer="chi-fu.wang@utsouthwestern.edu"

COPY target/springbootdemo.jar /springbootdemo.jar
EXPOSE 8080

CMD ["java", "-jar", "springbootdemo.jar"]

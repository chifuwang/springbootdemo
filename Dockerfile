FROM docker1.swmed.org:18082/aisopenjdk:11-jre-nanoserver-1809

LABEL maintainer="chi-fu.wang@utsouthwestern.edu"

COPY target/springbootdemo.jar /springbootdemo.jar
EXPOSE 8080

CMD ["java", "-jar", "springbootdemo.jar"]

FROM amazoncorretto:24.0.0-alpine3.21

WORKDIR /app

COPY target/test testApp-0.0.1-SNAPSHOT.jar app.jar

EXPOSE 8080

ENTRYPOINT["java", "-jar", "app.jar"]






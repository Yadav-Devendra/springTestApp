# Stage 1: Build the application
FROM maven:3.9.9-amazoncorretto-21-al2023 AS build
WORKDIR /app
COPY src ./src
COPY pom.xml .
RUN mvn clean package

# Stage 2: Create final image
FROM amazoncorretto:24.0.0-alpine3.21
WORKDIR /app
COPY --from=build /app/target/*.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java","-jar","app.jar"]

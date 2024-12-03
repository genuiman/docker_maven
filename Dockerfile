# Используем Maven для сборки
FROM maven:3.9.4-eclipse-temurin-17 AS build
WORKDIR /app
COPY pom.xml .
RUN mvn dependency:go-offline
COPY src ./src
RUN mvn clean package

# Используем Java для запуска
FROM eclipse-temurin:17-jre
WORKDIR /app
COPY --from=build /app/target/my-maven-app-1.0-SNAPSHOT.jar app.jar
EXPOSE 8080
CMD ["java", "-jar", "app.jar"]

# Используем базовый образ Maven с OpenJDK
FROM maven:3.8-openjdk-17 AS build

# Устанавливаем рабочую директорию
WORKDIR /app

# Копируем POM и загружаем зависимости
COPY pom.xml .
RUN mvn dependency:go-offline -B

# Копируем исходный код и собираем проект
COPY src ./src
RUN mvn package

# Используем легковесный образ для запуска
FROM openjdk:17-jdk-slim
WORKDIR /app

# Копируем JAR-файл из предыдущего этапа
COPY --from=build /app/target/app.jar .

# Запускаем приложение
CMD ["java", "-jar", "app.jar"]

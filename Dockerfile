FROM maven:3.8-openjdk-17

# Устанавливаем рабочую директорию
WORKDIR /app

# Копируем файл pom.xml и загружаем зависимости
COPY pom.xml .
RUN mvn dependency:go-offline -B

# Копируем исходный код проекта
COPY src ./src

# Компилируем проект
RUN mvn package

# Выполняем JAR (замените <your-app> на название JAR)
CMD ["java", "-jar", "target/<your-app>.jar"]

# Используем официальный образ Maven
FROM maven:3.9.4-eclipse-temurin-17

# Устанавливаем рабочую директорию
WORKDIR /app

# Копируем проект в контейнер
COPY . .

# Компилируем и собираем проект
RUN mvn clean package

# Команда по умолчанию (опционально)
CMD ["mvn", "clean", "install"]

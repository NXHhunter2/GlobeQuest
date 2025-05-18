FROM python:3.10-slim

# Установка системных библиотек
RUN apt-get update && apt-get install -y \
    libgl1 \
    libglib2.0-0 \
    && rm -rf /var/lib/apt/lists/*

# Установка зависимостей Python
WORKDIR /app
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Копирование проекта
COPY . .

# Запуск
CMD ["gunicorn", "main:app", "--bind", "0.0.0.0:80"]

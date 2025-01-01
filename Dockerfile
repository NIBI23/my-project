FROM python:slim
ENV PYTHONDONTWRITEBYCODE=1 \
    PYTHONUNBUFFERED=1
WORKDIR /app
COPY requirements.txt .
RUN pip inatall --no-cache-dir -r requirements.txt
COPY . .
RUN app.py train.py
EXPOSE 5000
CMD ["python", "app.py"]

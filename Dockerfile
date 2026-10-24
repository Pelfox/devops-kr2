FROM python:3.12.15-slim-bookworm

WORKDIR /app

COPY . .
RUN pip install -r requirements.txt

EXPOSE 8000
CMD gunicorn --bind 127.0.0.1:8000 app:app

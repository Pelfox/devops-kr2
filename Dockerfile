FROM python:3.12.15-slim-bookworm

WORKDIR /app

COPY . .
RUN pip install -r requirements.txt

EXPOSE 8000
CMD ["gunicorn", "--bind", "0.0.0.0:8000", "app:app"]

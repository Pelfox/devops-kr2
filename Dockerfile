FROM python:3.12.15-slim-bookworm

WORKDIR /app

COPY . .
RUN pip install -r requirements.txt

RUN useradd --create-home --uid 10001 --user-group \
    --shell /usr/sbin/nologin appuser \
    && chown -R appuser:appuser /app
USER appuser

EXPOSE 8000
CMD ["gunicorn", "--bind", "0.0.0.0:8000", "app:app"]

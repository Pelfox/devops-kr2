FROM python:3.12.15-slim-bookworm

WORKDIR /app

COPY . .
RUN pip install -r requirements.txt

RUN useradd --create-home --uid 10001 --user-group \
    --shell /usr/sbin/nologin appuser \
    && chown -R appuser:appuser /app
USER appuser

HEALTHCHECK --interval=30s \
	--timeout=3s \
    	--start-period=10s \
	--retries=3 \
    	CMD ["python", "-c", "import urllib.request; urllib.request.urlopen('http://127.0.0.1:8000/health', timeout=2)"]

EXPOSE 8000
CMD ["gunicorn", "--bind", "0.0.0.0:8000", "app:app"]

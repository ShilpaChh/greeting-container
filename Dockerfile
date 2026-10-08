FROM python:3.12-slim@sha256:05cda9777409a9c3ffddd94a4c476b79f0769a0b4857f0c7ed9226b6800b0d6f

WORKDIR /app

# Copy dependencies first to take adv of Docker layer caching
COPY app/requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

# Copy application code separately for dependency installation
COPY app ./app

# Run the application as a non-root user
RUN useradd --create-home appuser

USER appuser

EXPOSE 8080

CMD ["gunicorn", "--chdir", "app", "--bind", "0.0.0.0:8080", "--workers", "2", "app:app"]

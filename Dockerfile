# Simple, small Python image
FROM python:3.12-slim

# Safe, predictable Python behavior
ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1

WORKDIR /app

# Install dependencies first (better layer caching)
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy application code
COPY src/ ./app/

# Container port
EXPOSE 8080

# Production server
CMD ["gunicorn", "-w", "2", "-b", "0.0.0.0:8080", "app.main:app"]

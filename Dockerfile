# ─── Stage 1: Build/Dependencies ──────────────────
FROM python:3.11-slim AS builder

WORKDIR /usr/src/app

# Install dependencies in isolated layer
COPY requirements.txt .
RUN pip install --no-cache-dir --prefix=/install -r requirements.txt

# ─── Stage 2: Runtime ─────────────────────────────
FROM python:3.11-slim

WORKDIR /usr/src/app

# Copy only installed packages from builder
COPY --from=builder /install /usr/local

COPY . .

EXPOSE 5000

CMD ["python", "app.py"]

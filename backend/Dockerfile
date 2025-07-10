# Backend Dockerfile

FROM python:3.11-slim AS builder

WORKDIR /app

COPY requirements.txt constraints.txt ./
RUN pip install --upgrade pip && \
    pip install --user -r requirements.txt -c constraints.txt

FROM python:3.11-slim

WORKDIR /app

COPY --from=builder /root/.local /root/.local
ENV PATH="/root/.local/bin:$PATH"

COPY app/ ./app

CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]

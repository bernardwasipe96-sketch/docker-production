FROM python:3.12-alpine AS builder

WORKDIR /install

COPY requirements.txt .

RUN pip install --prefix=/install/deps --no-cache-dir -r requirements.txt


FROM python:3.12-alpine

WORKDIR /app

RUN apk add --no-cache curl

COPY --from=builder /install/deps /usr/local

COPY . .

EXPOSE 5000

CMD ["python", "app.py"]
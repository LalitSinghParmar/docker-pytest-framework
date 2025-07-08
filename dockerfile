FROM python AS builder
WORKDIR /app
COPY requirements.txt .
RUN pip install -r requirements.txt

FROM python:3.10-slim
WORKDIR /app
COPY . .
COPY --from=builder /usr/local/bin /usr/local/bin
COPY --from=builder /usr/local/lib /usr/local/lib
CMD ["pytest", "--html=report.html"]
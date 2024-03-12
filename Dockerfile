FROM golang:1.21.3-alpine
WORKDIR /app

COPY . .
RUN go mod download

RUN go build -o bin ./cmd/api
RUN chmod +x bin/api
CMD ["./bin/api"]
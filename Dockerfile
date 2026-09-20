FROM golang:1.27-alpine AS builder
WORKDIR /app
COPY go.mod ./
COPY main.go ./
RUN CGO_ENABLED=0 go build -o neural-db .

FROM alpine:3.21
RUN apk add --no-cache ca-certificates
COPY --from=builder /app/neural-db /usr/local/bin/neural-db
ENTRYPOINT ["neural-db"]

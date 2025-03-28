FROM golang:1.23-alpine AS builder

WORKDIR /app
COPY go.mod .
COPY main.go .
RUN go build -ldflags="-s -w" -o fullcycle

FROM scratch
COPY --from=builder /app/fullcycle /fullcycle
ENTRYPOINT ["/fullcycle"]

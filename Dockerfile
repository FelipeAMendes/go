# stage 1
FROM golang:1.20 AS builder

WORKDIR /app

COPY *.go .

RUN go build hello-world.go && \
    rm -rf /root/.cache

# stage 2
FROM scratch

COPY --from=builder /app/hello-world /hello-world

ENTRYPOINT ["/hello-world"]
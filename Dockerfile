FROM golang:alpine AS builder

WORKDIR $GOPATH/src/main/hello/
COPY . .
RUN go build -o /hello

FROM scratch
COPY --from=builder /hello /hello
ENTRYPOINT ["/hello"]
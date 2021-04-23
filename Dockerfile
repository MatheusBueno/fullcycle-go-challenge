FROM golang:alpine3.13 as builder

WORKDIR /go/src/

COPY app.go .

RUN go build app.go

FROM scratch

COPY --from=builder /go/src/ ./

ENTRYPOINT [ "/app" ]
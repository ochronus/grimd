FROM golang
LABEL mantainer="ochronus@ochronus.com"

ADD *.go /go/src/github.com/ochronus/grimd/
WORKDIR /go/src/github.com/ochronus/grimd
RUN go get -v
RUN go build -v
RUN mkdir /app
RUN cp grimd /app/grimd
WORKDIR /app

EXPOSE 53:53/udp
EXPOSE 53:53/tcp
EXPOSE 8080

ENTRYPOINT ["/app/grimd"]

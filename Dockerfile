FROM golang:1.18
ENV PORT 1323
EXPOSE 1323

WORKDIR /go/src/app
COPY . .

RUN go mod vendor
RUN go build -v -o app
RUN mv ./app /go/bin/

CMD ["app"]
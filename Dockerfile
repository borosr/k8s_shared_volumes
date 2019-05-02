FROM golang:1.11.9-alpine3.9

WORKDIR $GOPATH/src/api/

COPY . .

RUN apk add --no-cache git

RUN go get -d -v 
RUN go install -v

EXPOSE 3000

CMD ["api"]
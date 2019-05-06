# FROM golang:1.11.9-alpine3.9

# WORKDIR $GOPATH/src/api/

# COPY . .

# RUN apk add --no-cache git

# RUN go get -d -v 
# RUN go install -v

# EXPOSE 3000

# CMD ["api"]

FROM alpine

RUN apk add --no-cache coreutils

RUN mkdir /tmp/writer_volume

RUN echo "some writer data" > /tmp/writer_volume/data

RUN echo "while true; do echo '.' >> /tmp/writer_volume/data; sleep 2; done" > /entrypoint.sh
RUN chmod +x /entrypoint.sh

# ENTRYPOINT ["tail", "-f", "/dev/null"]
ENTRYPOINT [ "/bin/sh", "/entrypoint.sh" ]
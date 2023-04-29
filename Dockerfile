FROM golang:1.19-alpine as builder

ENV ROOT=/go/src/app
WORKDIR ${ROOT}
# alpineは最低限しか入ってないので、アップデートとgitのインストール
RUN apk update && apk add git
COPY go.mod go.sum ./
RUN go mod download

COPY . ${ROOT}
RUN CGO_ENABLED=0 GOOS=linux go build -o $ROOT/binary

#コンテナ内でコマンド実行したいので、alpine入れとく
FROM alpine:3.14 as prod

ENV ROOT=/go/src/app
WORKDIR ${ROOT}
#コンテナ内でコマンド実行したいので、bash入れとく
RUN apk add bash && apk add curl
COPY --from=builder ${ROOT}/binary ${ROOT}

EXPOSE 8080
CMD ["/go/src/app/binary"]
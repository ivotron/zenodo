FROM alpine:3.8
RUN apk add --no-cache curl jq
ADD entrypoint.sh /
ENTRYPOINT ["/entrypoint.sh"]

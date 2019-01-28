FROM alpine

COPY . /bin

RUN apk --update add --no-cache \
socat \
curl \
jq

ENTRYPOINT ["catapult-harvestmon"]

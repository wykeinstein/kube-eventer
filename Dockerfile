FROM alpine:3.12

LABEL maintainer="KeyOfSpectator <shichun.fsc@alibaba-inc.com>"

RUN /bin/sh -c "addgroup -g 1000 nonroot && adduser -u 1000 -D -H -G nonroot nonroot"

ENV TZ=Asia/Shanghai

RUN /bin/sh -c "apk add --no-cache tzdata && apk --no-cache --update upgrade"

RUN apk add ca-certificates

COPY --chown=nonroot:nonroot ./kube-eventer /kube-eventer

USER nonroot

WORKDIR /

RUN chown -R nonroot:nonroot /kube-eventer

ENTRYPOINT ["/kube-eventer"]


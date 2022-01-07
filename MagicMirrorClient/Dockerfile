FROM alpine:latest

# Dockerfile info
LABEL mantainer="Francesco Zanti"
LABEL maintainer_email="git@francescozanti.dev"

ENV URL http://mmserver:8080

RUN apk --no-cache --update add firefox-esr dbus-x11 ttf-freefont \
    && adduser -S magicmirror \
    && echo "magicmirror:magicmirror" | chpasswd

USER magicmirror

CMD firefox --new-instance --kiosk ${URL}

FROM alpine:latest

MAINTAINER mjikop1231 <mjikop1231@163.com>

COPY v2ray /usr/bin/v2ray/
COPY config.json /etc/v2ray/config.json

RUN mkdir /var/log/v2ray/ \
    && chmod +x /usr/bin/v2ray/v2ray

ENV PATH /usr/bin/v2ray:$PATH

EXPOSE 30001
EXPOSE 37192

CMD ["v2ray", "-config=/etc/v2ray/config.json"]

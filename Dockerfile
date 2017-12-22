FROM python:2.7-alpine

RUN apk update && \
    apk add git && \
    mkdir -p /data/input && \
    mkdir -p /data/output && \
    cd /data && \
    git clone https://github.com/Blizzard/heroprotocol.git && \
    cd /data/output

VOLUME [ "/data/input", "/data/output" ]

CMD python /data/heroprotocol/heroprotocol.py

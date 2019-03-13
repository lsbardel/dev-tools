FROM ubuntu
ENV DEBIAN_FRONTEND noninteractive

RUN apt update -q \
    && apt install -qy \
        build-essential wget libfontconfig1 \
        texlive-full \
    && rm -rf /var/lib/apt/lists/*

ENV HOME /data
WORKDIR /data

VOLUME ["/data"]
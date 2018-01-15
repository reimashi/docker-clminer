FROM ubuntu:16.04

ADD libs.tar.gz /usr/lib
ADD conf.tar.gz /etc
RUN ldconfig /usr/lib /usr/lib/amdgpu-pro

RUN mkdir /miner
ADD claymore.tar.gz /miner

RUN apt update && apt install libcurl3 clinfo

ENTRYPOINT /miner/start.bash

FROM ubuntu:22.04

RUN apt clean && \
    apt update && \
    apt install -y ffmpeg gpac nginx libnginx-mod-rtmp && \
    mkdir -p /data/hls && \
    mkdir -p /data/dash && \
    mkdir -p /data/progressive

COPY sample.mp4 /data/dash   

WORKDIR /data/dash

RUN MP4Box -dash 10000 -frag 10000 -rap -segment-name segment_ sample.mp4

RUN mv /data/dash/sample.mp4 /data/hls

WORKDIR /data/hls

RUN ffmpeg -i sample.mp4 -codec: copy -start_number 0 -hls_time 30 -hls_list_size 0 -f hls sample.m3u8

COPY nginx.conf /etc/nginx

RUN mv sample.mp4 /data/progressive 

ENTRYPOINT ["/usr/sbin/nginx", "-g", "daemon off;"]

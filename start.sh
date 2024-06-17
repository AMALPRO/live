#!/bin/sh

ffmpeg -i "http://145.239.5.177:8080/567/index.m3u8" \
       -vf "scale=-2:1080" \
       -c:v libx264 -b:v 4500K \
       -c:a aac -b:a 128k \
       -buffer_size 2048k \
       -rw_timeout 5000000 \
       -f flv "rtmp://a.rtmp.youtube.com/live2/8vt3-84u0-kpcy-fk7r-cr49"

#!/bin/sh

ffmpeg -re -fflags +genpts \
       -i "https://segment.yuppcdn.net/110322/channel24/playlist.m3u8" \
       -vf "scale=-2:1080" \
       -c:v libx264 -b:v 4500K \
       -c:a aac -b:a 128k \
       -buffer_size 8192k \
       -rw_timeout 10000000 \
       -strict -2 \
       -f flv "rtmp://a.rtmp.youtube.com/live2/8vt3-84u0-kpcy-fk7r-cr49"

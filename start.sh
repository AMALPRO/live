#!/bin/sh

ffmpeg -i "https://segment.yuppcdn.net/110322/channel24/playlist.m3u8" \
       -i watermark.png \   # Assuming watermark.png is in the same directory
       -filter_complex "[0:v][1:v] overlay=(main_w-overlay_w)/2:(main_h-overlay_h)/1.1" \
       -vf "scale=-2:1080" \
       -c:v libx264 -b:v 4500K \
       -c:a aac -b:a 128k \
       -buffer_size 2048k \
       -rw_timeout 5000000 \
       -f flv "rtmp://a.rtmp.youtube.com/live2/8vt3-84u0-kpcy-fk7r-cr49"

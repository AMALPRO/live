#!/bin/sh

ffmpeg -re -fflags +genpts \
       -i "https://segment.yuppcdn.net/110322/channel24/playlist.m3u8" \
       -vf "scale=-2:720, drawtext=text='watchasports.in':fontsize=36:fontcolor=white:x=(w-text_w)/2:y=(h-text_h-50)" \
       -c:v libx264 -preset veryfast -tune zerolatency -crf 23 \
       -c:a aac -b:a 128k \
       -buffer_size 8192k \
       -max_muxing_queue_size 1024 \
       -rw_timeout 10000000 \
       -strict -2 \
       -f flv "rtmp://a.rtmp.youtube.com/live2/8vt3-84u0-kpcy-fk7r-cr49"

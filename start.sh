#!/bin/sh

while true
do
    ffmpeg -re -fflags +genpts \
           -i "http://50.7.218.122:8080/gemjunior/index.m3u8" \
           -i "https://i.ibb.co/5GY0CVT/logo.png" \
           -filter_complex " \
           [1:v]scale=100:-1[logo]; \
           [0:v]scale=-2:720[v0]; \
           [v0][logo]overlay=x=W-w-30:y=30, \
           drawtext=text='watchasports.in':fontsize=38:fontcolor=white:x=(w-text_w)/2:y=(h-text_h-90)" \
           -c:v libx264 -preset veryfast -tune zerolatency -crf 23 \
           -maxrate 2000k -bufsize 4000k \
           -c:a aac -b:a 128k \
           -f flv "rtmp://live.restream.io/live/re_8087088_bad11148233976dd9d57"

    # Wait for 5 seconds before restarting if the command exits
    sleep 5
done

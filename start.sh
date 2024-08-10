#!/bin/sh

# Download the logo from the URL
curl -o /tmp/logo.png "https://i.ibb.co/5GY0CVT/logo.png"

while true
do
    ffmpeg -re -fflags +genpts \
           -i "https://allinonereborn.in/sliv.m3u8?ch=TEN2HD&id=2020434" \
           -i "/tmp/logo.png" -filter_complex \
           "[0:v][1:v] overlay=W-w-10:H-h-10, \
    drawtext=text='watchasports.in':fontsize=38:fontcolor=white:x=(w-text_w)/2:y=(h-text_h-90), \
    drawtext=text='watchasports':fontsize=25:fontcolor=white:x=(w-text_w-30):y=30" \
           -c:v libx264 -preset veryfast -tune zerolatency -crf 23 \
           -maxrate 2000k -bufsize 4000k \
           -c:a aac -b:a 128k \
           -f flv "rtmp://live.restream.io/live/re_8087088_bad11148233976dd9d57"

    # Wait for 5 seconds before restarting if the command exits
    sleep 5
done

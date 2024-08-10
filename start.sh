#!/bin/sh

while true
do
    ffmpeg -re -fflags +genpts \
           -i "http://thunderbolt-40gbps.com/play/VSZx3MGCJpLbqnmI5wjgPBzuaa0kdmjV0U027_Fvcam-nHLL8BKS5m2JBotp0mi5" \
           -vf "scale=-2:720, \
    drawtext=text='watchasports.in':fontsize=38:fontcolor=white:x=(w-text_w)/2:y=(h-text_h-90), \
    drawtext=text='watchasports':fontsize=25:fontcolor=white:x=(w-text_w-30):y=30" \
           -c:v libx264 -preset veryfast -tune zerolatency -crf 23 \
           -maxrate 2000k -bufsize 4000k \
           -c:a aac -b:a 128k \
           -f flv "rtmp://live.restream.io/live/re_8087088_bad11148233976dd9d57"

    # Wait for 5 seconds before restarting if the command exits
    sleep 5
done

#!/bin/bash

# Variables
MPD_URL="https://linear302-it-dash1-prd-ll.cdn13.skycdp.com/016a/31209/FHD/skysportseriea/master.mpd"
KEY_ID="0036e5d0e88dfb087f1791da6150ced9"
KEY="0bc653d830837dceb13bd17169f0f8e2"
YOUTUBE_RTMP="rtmp://a.rtmp.youtube.com/live2/8vt3-84u0-kpcy-fk7r-cr49"

# Decrypt using Shaka Packager
packager \
input=$MPD_URL,stream=video,output=decrypted_video.mp4 \
input=$MPD_URL,stream=audio,output=decrypted_audio.aac \
--keys keyid=$KEY_ID:key=$KEY \
--enable_raw_key_decryption

# Stream to YouTube using FFmpeg
ffmpeg -i decrypted_video.mp4 -i decrypted_audio.aac \
       -vf "scale=-2:1080" \
       -c:v libx264 -b:v 4500K \
       -c:a aac -b:a 128k \
       -f flv $YOUTUBE_RTMP

#!/bin/bash

# Created with help from these pages in particular:
#   http://xmodulo.com/live-stream-video-webcam-linux.html
#   http://www.subsecret.dk/wiki/Transcoding_with_VLC
#   https://wiki.videolan.org/Documentation:Modules/v4l2/

/usr/bin/cvlc -I dummy --no-interact \
   v4l2:///dev/video0 :v4l2-standard= :live-caching=60 \
   :sout="#transcode{vcodec=h264,vb=512,scale=1,fps=5,acodec=none} \
   :http{mux=ts,dst=:8080/cam}" > /dev/null &

# /usr/bin/cvlc -I dummy --no-interact \
#   v4l2:///dev/video0 :v4l2-standard= :live-caching=60 \
#   :sout="#transcode{vcodec=h264,vb=512,scale=0.6,fps=5,acodec=none} \
#   :http{mux=ts,dst=:8080/cam}" > /dev/null &

# NOT WORKING, CAN'T GET A GOOD SIZE
#/usr/bin/vlc -I dummy v4l2:///dev/video0 :v4l2-standard= :live-caching=60 \
#   :sout="#transcode{vfilter=croppadd{croptop=16,cropbottom=16},vcodec=h264,vb=512,fps=5,acodec=none} \
#   :http{mux=ts,dst=:8080/cam}"

# WORKING (original)!
# /usr/bin/vlc -I dummy v4l2:///dev/video0 :v4l2-standard= :live-caching=60 \
#:sout="#transcode{croptop=250,vcodec=h264,vb=512,fps=5,scale=0.6,acodec=none}:http{mux=ts,dst=:8080/cam}"


This design is intended to facilitate mounting a small USB camera
(specifically a ELP-usb500w02m-l21) on a vertical surface, with a
good degree of flexibility in orientation.

I've specifically used this to mount one of these cameras (the 170
degree field of view version) inside my R2X.

The "hood" piece is optional and can be used to shield the lens
from a light source. In my case I wanted to prevent the bright LEDs
in the front of my R2X from impacting image quality.

12mm M2 screws can be used to attach the camera to the mount by
simply screwing into the plastic (no need for nuts on the back).
The bracket can be attached to the vertical surface using #10-32
machine screws or similar. A 3/16 inch drill bit can be used to
ensure the holes in the mounting bracket are sized for the #10
screws.

The camera output is processed using an ODROID camera and VLC. A
sample VLC command line that works for me is:
   /usr/bin/cvlc -I dummy --no-interact \
   v4l2:///dev/video0 :v4l2-standard= :live-caching=60 \
   :sout="#transcode{vcodec=h264,vb=512,scale=1,fps=5,acodec=none} \
   :http{mux=ts,dst=:8080/cam}" > /dev/null &

I'll be honest that working with VLC can be maddening, so please do not
ask me to help debug :). Good luck!

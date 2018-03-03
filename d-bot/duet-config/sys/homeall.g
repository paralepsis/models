;  home the X axis

; Lower Z relative to current position
G91
G1 Z+5 F6000

; Move quickly to around the X and Y axis endstops (first pass)
G1 X-255 Y255 F6000 S1
G1 X-255 F6000 S1
G1 Y255 F6000 S1

; Go back a few mm in X and Y
G1 X5 F1800
G1 Y-5 F1800

; Move slowly to X axis endstop once more (second pass)
G1 X-255 F360 S1

; Move slowly to Y axis endstop once more (second pass)
G1 Y255 F360 S1

; home the Z axis

; Move somewhat quickly up to Z axis endstop and stop there (first pass)

G1 Z-255 F6000 S1

; Go back a few mm
G1 Z+5 F2400

; Move slowly to X axis endstop once more (second pass)
G1 Z-255 F80 S1
G1 Z5 F2400

; Absolute again
G90


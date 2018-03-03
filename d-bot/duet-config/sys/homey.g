; homey.g
; called to home the Y axis
;
; Note: This version stays in relative mode throughout.

G91             ; Relative Mode

G1 Z+5 F6000 S2 ; Raise Z (S2 because Z likely not homed)

G1 Y320 F1800 S1 ; Move quickly to Y axis endstop and stop there (first pass)

G1 Y-5 F6000    ; Go back a few mm
G1 Y320 F360 S1 ; Move slowly to & axis endstop once more (second pass)

G1 Z-5 F6000 S2 ; Lower Z again (S2 because Z likely not homed)

G90             ; Absolute mode

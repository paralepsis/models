; homex.g
; called to home the X axis
;

G91             ; Relative Mode
G1 Z+5 F6000 S2 ; Raise Z (S2 because Z probably isn't homed)
G90             ; Abs. Mode

G1 X-400 F1800 S1 ; quickly to X axis endstop and stop there (first pass)

G91              ; Relative Mode
G1 X5 F6000      ; Go back a few mm
G90              ; Absolute Mode
G1 X-400 F360 S1 ; Move slowly to X axis endstop once more (second pass)

G1 X150 F1800   ; Move to near center of plate
G91             ; Relative Mode
G1 Z-5 F6000 S2 ; Lower Z (S2 because Z probably isn't homed)
G90             ; Abs. Mode

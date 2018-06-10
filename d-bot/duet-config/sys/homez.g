; homez.g
; called to home the Z axis
;

; M561               ; clear transform, same as G29 S2
M280 P3 S160 I1    ; clear any alarm
G91                ; relative mode
G1 Z10 F300 S2     ; raise Z (S2 because Z probably isn't homed)
G90                ; abs. mode
G1 X150 Y190 F1800 ; roughly center of bed (for the probe)
M400               ; wait for moves
M401               ; deploy probe
G30                ; probe bed to establish Z=0
M402               ; retract probe
G91                ; relative mode
G1 Z10 F300 S2     ; raise Z again
G90                ; abs. mode

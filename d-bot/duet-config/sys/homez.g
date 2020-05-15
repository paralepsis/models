; homez.g
; called to home the Z axis
;

M280 P3 S160 I1    ; clear any alarm
G91                ; relative mode
G1 Z10 F300 S2     ; raise Z (S2 because Z probably isn't homed)
G90                ; abs. mode

G1 X182.5 Y150 F1800 ; roughly center of bed (for the probe) -- this is a point in the grid, accounting for probe offset
M400               ; wait for moves
G30                ; probe bed to establish Z=0

G1 Z10 F300        ; raise Z again

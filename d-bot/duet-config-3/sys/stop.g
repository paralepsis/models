; stop.g
; called when M0 (Stop) is run (e.g. when a print from SD card is cancelled)

G91  ; relative movement
G1 Z5 F5000  ; lift nozzle
G90  ; absolute movement

M104 S0   ; turn off extruder (set temp to 0 and don't wait)
M140 S0	  ; turn off bed (set temp to 0 and don't wait)

M107      ; turn off part fan
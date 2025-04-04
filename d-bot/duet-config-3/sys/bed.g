; bed.g
; called to perform automatic bed compensation via G32
;
; generated by RepRapFirmware Configuration Tool v3.1.3 on Thu Jun 18 2020 13:36:53 GMT-0500 (Central Daylight Time)
;
; 12/09/2020: Added M280 P0 S160 to clear any errors as an attempt to make this more resilient

G1 X180 Y163 F1800 ; roughly center of bed (for the probe) -- this is a point in the grid, accounting for probe offset
G1 Z10 F300                    ; position over bed
M190 S70                       ; heat to 70 degrees, wait to complete

M280 P0 S160

M561                           ; clear any bed transform
G29 S2                         ; clear current bed map (does it matter?)
G30                            ; probe bed to establish Z=0

G29                            ; probe the bed and enable compensation

M140 S0                        ; stop heating
G1 Z15 F300                    ; just get the extruder sort of out of the way


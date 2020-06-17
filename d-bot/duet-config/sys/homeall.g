; homeall.g
  
G28 X    ; home the X axis using homex.g script
G28 Y    ; home the Y axis using homey.g script
G28 Z    ; home the Z axis using homez.g script

G1 X150 Y150 Z20 F999999 ; move to near center, a little off the plate

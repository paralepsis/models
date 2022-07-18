#!/usr/local/bin/python
#
# Original script by DigitalVision at https://forum.duet3d.com/topic/6698/pressure-advance-calibration
#
# Modified by strips:
# * Prints a box instead of two walls
# * Tidied up the skirt generation as id did some strange moves
# * has a text block for starting gcode and end gcode
#

# extrusion parameters (mm)
extrusion_width   = 0.36
layer_height      = 0.12
filament_diameter = 1.75

# print speeds (mm/s)
travel_speed      = 150
first_layer_speed =  10
slow_speed        =  10
fast_speed        =  85

# printing temperatures
print_temperatures = {
    'tool_standby': 150,
    'tool_temp': 240,
    'bed_temp': 110
}

# calibration object dimensions (mm)
layers        = 400
object_length  = 150
object_width  = 40
num_patterns  =  2
pattern_width =  15

# pressure advance gradient (s)
pressure_advance_min = 2
pressure_advance_max = 2.7

# center of print bed (mm)
offset_x = 175
offset_y = 175

layer0_z = layer_height

start_gcode = """\
; Select tools and heating
T-0 P0              ; deselect tools
M106 S0             ; turn off fan
G10 P0 R{tool_standby} S{tool_temp}    ; set tool active and standby temperatures
M190 S{bed_temp}           ; set and wait for bed temperature
T0 P0               ; select tool (activates temp)
M116                ; wait to reach temperatures 

; home and level
G32                 ; home and level bed by screws
G29                 ; MBL

; set modes
G90                 ; Set to Absolute Positioning
M83                 ; Set extruder to relative mode
G92 E0.0000         ; Set Position
"""

end_gcode = """\

; move extruder out of the way
G91
G1 Z3 E-5 F9999
G1 X999 Y999 Z50 H1 F500
G1 X-5 Y-5 F9999
G90

; turn off everything
M106 S0 	; turn off cooling fan
G10 P0 S0 	; turn off extruder
M140 S0 	; turn off bed
M108        ; cancel heating
M18         ; disable motors
"""

from math import *

print(start_gcode.format(**print_temperatures))

def extrusion_volume_to_length(volume):
    return volume / (filament_diameter * filament_diameter * 3.14159 * 0.25)

def extrusion_for_length(length):
    return extrusion_volume_to_length(length * extrusion_width * layer_height)

curr_x = offset_x
curr_y = offset_y
curr_z = layer0_z

# goto z height
print("G1 X%.3f Y%.3f Z%.3f F%.0f" % (curr_x, curr_y, curr_z, travel_speed * 60))

def up():
    global curr_z
    curr_z += layer_height
    print("G1 Z%.3f" % curr_z)

def line(x,y,speed):
    length = sqrt(x**2 + y**2)
    global curr_x, curr_y
    curr_x += x
    curr_y += y
    if speed > 0:
        print("G1 X%.3f Y%.3f E%.4f F%.0f" % (curr_x, curr_y, extrusion_for_length(length), speed * 60))
    else:
        print("G1 X%.3f Y%.3f F%.0f" % (curr_x, curr_y, travel_speed * 60))

def goto(x,y):
    global curr_x, curr_y
    curr_x = x + offset_x
    curr_y = y + offset_y
    print("G1 X%.3f Y%.3f" %(curr_x, curr_y))

line(-object_length/2,0,0) # go to start of first line

for l in range(2):
    for offset_i in range(5):
        offset = offset_i * extrusion_width
        line(object_length+offset*2,0,first_layer_speed)       # extrude line full width towards x+
        line(0,extrusion_width+offset*2+object_width,first_layer_speed)  # extrude line layer width y+
        line(-object_length-extrusion_width-offset*2,0,first_layer_speed)    # extrude line full width towards x- (return)
        line(0,-extrusion_width-offset*2-object_width,first_layer_speed) # extrude line layer width y-
        #line(offset,0,first_layer_speed)                    # move offset x+
        line(0,-extrusion_width,first_layer_speed)
    up()
    goto(-object_length/2,0)

segment = (object_length*1.0) / num_patterns
space = segment - pattern_width

for l in range(layers):
    
    pressure_advance = (l / (layers * 1.0)) * (pressure_advance_max-pressure_advance_min) + pressure_advance_min;
    
    print("; layer %d, pressure advance: %.3f, height: %.3f mm" %(l, pressure_advance, curr_z))
    
    print("M572 D0 S%.3f" % pressure_advance)
    
    for i in range(num_patterns):
        line(space/2, 0, fast_speed)
        line(pattern_width, 0, slow_speed)
        line(space/2, 0, fast_speed)
    
    line(0,extrusion_width+object_width,fast_speed)

    for i in range(num_patterns):
        line(-space/2, 0, fast_speed)
        line(-pattern_width, 0, slow_speed)
        line(-space/2, 0, fast_speed)
    
    line(0,-extrusion_width-object_width,fast_speed)
    up()


print(end_gcode)


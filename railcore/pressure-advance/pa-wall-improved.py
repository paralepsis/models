#!/usr/bin/env python3

# python script which outputs gcode for pressure calibration
# adapt and run it like
# "python advance_cal.py > advance_cal.gcode"

# source: https://forum.duet3d.com/topic/6698/pressure-advance-calibration/181

import math

# extrusion parameters (mm)
extrusion_width = 0.4
layer_height = 0.2
filament_diameter = 1.75
z_offset = 0.13

# print speeds (mm/s)
travel_speed = 150
first_layer_speed = 20
slow_speed = 20
fast_speed = 90

# calibration object dimensions (mm)
layers = 200
object_width = 90
num_patterns = 2
pattern_width = 5

# pressure advance gradient (s)
pressure_advance_min = 0.0
pressure_advance_max = 0.3

# center of print bed (mm)
offset_x = 140
offset_y = 140


pressure_advance_command = "M572 D0 S" # Repetier / Duet


# enter your extruder and bed heating gcode here (take it from an old sliced gcode file)
# M83 / relative extruder mode is mandatory!
preamble = """

G90 ; use absolute coordinates
M83 ; extruder relative mode
M104 S160 ; set extruder (intermediate) temp
M140 S70 ; set bed temp
M190 S70 ; wait for bed temp
M109 S260 ; wait for extruder temp
G28 X Y; home X and Y
M106 S0
G21 ; set units to millimeters
G90 ; use absolute coordinates
M83 ; extruder relative mode
G92 E0
"""

# enter your heater off, fand off, etc. gcode here (take it from an old sliced gcode file)
postamble = """
M0
"""

layer0_z = layer_height + z_offset

def extrusion_volume_to_length(volume):
    return volume / (filament_diameter * filament_diameter * math.pi * 0.25)


def extrusion_for_length(length):
    return extrusion_volume_to_length(length * extrusion_width * layer_height)


curr_x = offset_x
curr_y = offset_y
curr_z = layer0_z

print(preamble)
# goto z height
print("G1 X%.3f Y%.3f Z%.3f F%.0f" % (curr_x, curr_y, curr_z, travel_speed * 60))


def up():
    global curr_z
    curr_z += layer_height
    print("G1 Z%.3f" % curr_z)


def line(x, y, speed):
    length = math.sqrt(x ** 2 + y ** 2)
    global curr_x, curr_y
    curr_x += x
    curr_y += y
    if speed > 0:
        print(
            "G1 X%.3f Y%.3f E%.4f F%.0f"
            % (curr_x, curr_y, extrusion_for_length(length), speed * 60)
        )
    else:
        print("G1 X%.3f Y%.3f F%.0f" % (curr_x, curr_y, travel_speed * 60))


def goto(x, y):
    global curr_x, curr_y
    curr_x = x + offset_x
    curr_y = y + offset_y
    print("G1 X%.3f Y%.3f" % (curr_x, curr_y))


line(-object_width / 2, 0, 0)

for l in range(2):
    for offset_i in range(5):
        offset = offset_i * extrusion_width
        line(object_width + offset, 0, first_layer_speed)
        line(0, extrusion_width + offset * 2, first_layer_speed)
        line(-object_width - offset * 2, 0, first_layer_speed)
        line(0, -extrusion_width - offset * 2, first_layer_speed)
        line(offset, 0, first_layer_speed)
        line(0, -extrusion_width, 0)
    up()
    goto(-object_width / 2, 0)

segment = (object_width * 1.0) / num_patterns
space = segment - pattern_width

for l in range(layers):

    pressure_advance = (l / (layers * 1.0)) * (
        pressure_advance_max - pressure_advance_min
    ) + pressure_advance_min

    print("; layer %d, pressure advance: %.2f" % (l, pressure_advance))

    print("%s%.3f" % (pressure_advance_command, pressure_advance))

    for i in range(num_patterns):
        line(space / 2, 0, fast_speed)
        line(pattern_width, 0, slow_speed)
        line(space / 2, 0, fast_speed)

    line(0, extrusion_width, fast_speed)

    for i in range(num_patterns):
        line(-space / 2, 0, fast_speed)
        line(-pattern_width, 0, slow_speed)
        line(-space / 2, 0, fast_speed)

    line(0, -extrusion_width, fast_speed)
    up()

print(postamble)

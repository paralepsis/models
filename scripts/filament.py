# https://manual.slic3r.org/advanced/flow-math

import sys
import math

# Gather input
m_f_dia   = float(input("Measured filament diameter (mm): "))
m_layer   = float(input("Selected layer thickness (mm): "))
ex_mult   = float(input("Experimental extrusion multiplier: "))
est_n_dia = float(input("Est. nozzle dia. (target wall thickness) (mm): "))
m_wall    = float(input("Measured wall thickness (mm): "))

# target_xsec -- calculated rectangular cross section with
#                selected layer thickness, and guessed nozzle dia.
#
# New formula, from https://manual.slic3r.org/advanced/flow-math):
#
target_xsec = m_layer * (est_n_dia - m_layer) + 3.14159 * (m_layer/2)**2

# calculate measured area of material, assuming
# formula above with rounded ends
#
m_xsec = m_layer * (m_wall - m_layer) + 3.14159 * (m_layer/2)**2

print("\nCross sectional area:\n  Target: %1.4f" % (target_xsec))
print("  Measured: %1.4f" % (m_xsec))

# calculate the cross section of the filament from filament and extrusion mult.
ex_xsec = 3.14159 * (m_f_dia/2)**2 * ex_mult

# calculate how much filament would have been pushed by the extruder in mm for
# 1mm of wall (recall target_vol_mm3 is for 1 mm of print...), assuming that the
# slicer also uses the rectangular cross section model (which it does not).
# m_extruder_mm = target_xsec / ex_xsec

# work back to a more accurate filament diameter and ext. mult. of 1
# target_xsec_mm2 = ex_xsec * target_vol_mm3 / m_vol_mm3
# new_f_dia = math.sqrt(4 * target_xsec_mm2 / 3.14159)

# Standard practice is to pretend that the extrusion multiplier
# is linearly related to the wall thickness. Another way to calculate
# the suggested adjustment is as follows:
#   new_mult = target_vol_mm3 / m_vol_mm3 * ex_mult
new_mult = est_n_dia / m_wall * ex_mult

print("\nSuggested ext. multiplier for %1.3f mm diameter is %1.3f." % (m_f_dia, new_mult))
# print("Alternatively, adjust filament diameter to %1.3f mm and ext. mult. to 1" % (new_f_dia))

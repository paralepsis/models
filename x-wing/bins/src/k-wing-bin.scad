/* k-wing-bin.scad
 *
 * Copyright (C) Robert B. Ross, 2016
 *
 * This software is released under the Creative Commons
 * Attribution-ShareAlike 4.0 International Public License.
 */

include <./bintools.scad>

kWingOutline();
// kWingBlank();

module kWingBin() {
   harborFreightLargeHalfHt(locations=[[[0,0,0],[0,0,0]]])
      import("../products/k-wing-blank.stl");
}

module kWingOutline() {
   translate([0,0,22]) rotate([180,0,0]) 
      blankCutout(height=22 - 0.1, outlineScale=1.2) import("../products/k-wing-blank.stl");
}

/*
 * Local variables:
 *  mode: C
 *  c-indent-level: 3
 *  c-basic-offset: 3
 * End:
 *
 * vim: ts=8 sts=4 sw=4 expandtab
 */

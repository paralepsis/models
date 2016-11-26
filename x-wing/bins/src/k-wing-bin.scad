/* k-wing-bin.scad
 *
 * Copyright (C) Robert B. Ross, 2016
 *
 * This software is released under the GNU General Public License
 * Version 3.
 *
 */

include <./bintools.scad>

binHeight=46.5/2;
blankHeight=22;

kWingBin();
// kWingAndXBin();
// kWingOutline();
// kWingBlank();

module kWingBin() {
   harborFreightLargeHalfHt(locations=[[[2.5,0,0],[0,0,90]]],inset=0.25,
                            bottomThick=0.9) kWingBlank();
}
module kWingAndXBin() {
   harborFreightLargeHalfHt(locations=[[[0,0,0],[0,0,0]]],inset=0.25,
                            bottomThick=0.9)
   union() {
      translate([2.5,6.25,0]) rotate([0,0,90]) kWingBlank();
      translate([-14.5,-30,0]) rotate([0,0,180]) import("../orig/x-wing-blank.stl");
   }
}

module kWingOutline() {
   translate([0,0,binHeight]) rotate([180,0,0]) {
      blankCutout(height=binHeight, outlineScale=1.2) kWingBlank();
   }
}

module kWingBlank() {
   linear_extrude(height=blankHeight) for(i=[0:1]) mirror([i,0,0])
      polygon(points=[[-0.1,-35.75], [5.5,-35.75], [5.5,-32.1], [15.5,-32.1],
                      [15.5,-27.3], [46,-21.95], [46,-1.7], [40.5,-1.7],
                      [40.5,-5.65], [29.5,-5.65], [29.5,-1.5], [22.7,-1.5],
                      [22.7,-5.65], [11.0,-5.65], [11.0,15.85],
                      [5.5,19.5], [5.5,25], [-0.1,25]]);
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

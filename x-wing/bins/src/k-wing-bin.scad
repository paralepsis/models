/* k-wing-bin.scad
 *
 * Copyright (C) Robert B. Ross, 2016
 *
 * Outline derived from Graham Bridge's Stanley K-Wing bin:
 *   http://www.thingiverse.com/thing:1292334
 *
 * That model was released under CC Attribution-ShareAlike, as is this
 * one.
 *
 * This software is released under the Creative Commons
 * Attribution-ShareAlike 4.0 International Public License.
 */

include <./bintools.scad>

binHeight=46.5/2;
blankHeight=20; // made up for now

kWingOutline();
// kWingBlank();

module kWingBin() {
   harborFreightLargeHalfHt(locations=[[[0,0,0],[0,0,0]]])
      import("../products/k-wing-blank.stl");
}

module kWingOutline() {
   translate([0,0,46.5/2]) rotate([180,0,0]) {
      blankCutout(height=19 - 0.1, outlineScale=1.2) kWingBlank();
   }
}

module kWingBlank() {
   linear_extrude(height=blankHeight) for(i=[0:1]) mirror([i,0,0])
      polygon(points=[[-0.1,-35.75], [5.5,-35.75], [5.5,-32.1], [15.5,-32.1],
                      [15.5,-27.3], [45.5,-23.95], [45.5,-1.7], [40.5,-1.7],
                      [40.5,-5.65], [29.5,-5.65], [29.5,-1.5], [22.7,-1.5],
                      [22.7,-5.65], [12.5,-5.65], [12.5,15.85], [7,17.5],
                      [5.5,19.5], [5.5,25.27], [-0.1,25.27]]);
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

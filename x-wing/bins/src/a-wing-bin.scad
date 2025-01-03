/* a-wing-bin.scad
 *
 * Copyright (C) Robert B. Ross, 2016
 *
 * This software is released under the GNU General Public License
 * Version 3.
 */

$fn=40;

include <./bintools.scad>

/* locations is a pair of triples, translate : rotate pairs
 */
locations = [[[4.75,-23.5,0.0], [0,0,-90]],
             // [[0,0,0.0], [0,0,90]],
             [[-4.75,23.5,0.0],[0,0,90]]];

harborFreightMediumHalfHt(locations=locations)
   scale([1,1,15/15]) import("../orig/a-wing-blank-mod.stl");

// aWingOutline();

module aWingOutline() {
   translate([0,0,20]) rotate([180,0,0]) {
      blankCutout(height=20 - 0.1, outlineScale=1.2)
         import("../orig/a-wing-blank-mod.stl");
   }
}

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
locations = [[[5.5,-14.0,0.0], [0,0,-90]],
             // [[0,0,0.0], [0,0,90]],
             [[-5.5,14.0,0.0],[0,0,90]]];

/* 
harborFreightMediumHalfHt(locations=locations)
   scale([1,1,15/15]) import("../orig/m3-a-blank-mod.stl");
*/

m3aOutline();

module m3aOutline() {
   translate([0,0,18]) rotate([180,0,0]) {
      blankCutout(height=18 - 0.1, outlineScale=1.2)
         import("../orig/m3-a-blank-mod2.stl");
   }
}

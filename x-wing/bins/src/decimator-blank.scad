/* e-wing-bin.scad
 *
 * Copyright (C) Robert B. Ross, 2016
 *
 * This software is released under the GNU General Public License
 * Version 3.
 */

$fn=40;

include <./bintools.scad>

difference() {
   translate([0,0,25/2]) cube(size=[151,107,25],center=true);
   import("../orig/decimator-box.stl");
}

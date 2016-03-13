/* b-wing-bin.scad
 *
 * Copyright (C) Robert B. Ross, 2016
 *
 * This software is released under the GNU General Public License
 * Version 3.
 */

include <./bintools.scad>
use <b-wing-bin.scad>

/* locations is a pair of triples, translate : rotate pairs
 */
locations = [[[5,-4.5,0], [0,0,-33]]];

harborFreightMediumFullHt(locations=locations,inset=0.5) bWingBlank();

/* add in A-Wing */
if (1) {
   translate([-3,-19,0]) rotate([0,0,0]) difference() {
      blankOutline(height=46.5-0.1) import("../orig/a-wing-blank-mod.stl");
      translate([0,0,46.5]) mirror([0,0,1]) import("../orig/a-wing-blank-mod.stl");
   }
}


/*
 * Local variables:
 *  mode: C
 *  c-indent-level: 3
 *  c-basic-offset: 3
 * End:
 *
 * vim: ts=8 sts=3 sw=3 expandtab
 */

/* laser-bin.scad
 *
 * Copyright (C) Robert B. Ross, 2017
 *
 * This software is released under the Creative Commons
 * Attribution-ShareAlike 4.0 International Public License.
 */

include <./bintools.scad>

$fn=160;

/* locations is a pair of triples, translate : rotate pairs
 */
locations = [];

intersection() {
   union() {
      stanleyMediumFullHt(locations);
      translate([-52/2-0.25,2.6,0]) cube([52.,1.6,38]);
      translate([-52/2-0.25,3,0]) cube([11,36,38]);
      translate([-5,39,0]) rotate([0,-90,90]) linear_extrude(height=36) polygon(points=[[0,0],[0,11],[38,11], [38,9]]);
   }

   hull() stanleyMediumFullHt(locations);
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

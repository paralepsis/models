/* tie-bomber-bin.scad
 *
 * Copyright (C) Robert B. Ross, 2016
 *
 * This software is released under the Creative Commons Attribution
 * License. It is derived from the model by devonjones as downloaded on
 * 4/29/2016 from the following URL:
 *   http://www.thingiverse.com/thing:1255003
 *
 */

include <./bintools.scad>

$fn=160;
binHeight = 46.5;
angle=0;

/* locations is a pair of triples, translate : rotate pairs
 */
locations = [[[0,25.5,0], [0,0,90]],
             [[0,0,0], [0,0,90]],
             [[0,-25.5,0], [0,0,90]]];

harborFreightMediumFullHt(locations,inset=1) bomberBlank();

// bomberOutline();
// bomberBlank();

/* bomberOutline() -- test piece for outline
 */
module bomberOutline() {
   translate([0,0,37]) rotate([180,0,0]) {
      blankCutout(height=37 - 0.1, outlineScale=1.2) bomberBlank();
   }
}

module bomberBlank(centerCutout=1) {
   blankHeight = 37; 

   translate([-13,-26,0]) hull() {
      translate([1,51.5/2-32/2,0]) cube([24,32,blankHeight]);
      translate([1+(24-11)/2,51.5/2-44/2,0]) cube([11,45,blankHeight]);
   }
}

/* bomberShell() -- outline */
module bomberShell() {
   for (i=[0:1]) mirror([i,0,0]) 
      polygon(points=[[0,-31.5],[-5.7,-31.5], [-23.1,-31.5],[-24.1,-30.5],
         [-25.4,-14.6],[-24.5,-13.5],[-8.1,-12.1], [-6.5,-10.2],[-6.5,0.5],
         [-5.5,2.23],[-4.95,16.3],[-2.1,31.5],[0,31.5]]);
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

/* tie-fighter-bin.scad
 *
 * Copyright (C) Robert B. Ross, 2016
 *
 * This software is released under the Creative Commons
 * Attribution-ShareAlike 4.0 International Public License.
 */

include <./bintools.scad>

$fn=20;

/* locations is a pair of triples, translate : rotate pairs
 */
locations = [[[0,0,0], [0,0,0]],
             [[5.5, 21.3,0], [0,0,0]],
             [[-5.5, -21.3, 0],[0,0,0]]];

// harborFreightMediumFullHt(locations=locations) tieFighterBlank();
tieFighterBlank();

/* singleTieFighterOutline() -- test piece for outline
 */
module singleTieFighterOutline() {
   translate([0,0,46.5]) rotate([180,0,0]) {
      blankCutout(height=46.5 - 0.1, outlineScale=1.2) tieFighterBlank();
   }
}

/* tieFighterBlank() -- OpenSCAD blank in this case
 */
module tieFighterBlank() {
   translate([0,0,41/2]) rotate([180,0,0]) {
      // import("../orig/tie-fighter.stl");

      translate([-14.75,0,0]) panel();
      translate([14.75,0,0]) panel();

      /* cross-brace (whatever it is called) */
      translate([0,0,41/4-0.5]) cube([33,2.75*2,43/2], center=true);

      // rotate([0,90,0]) translate([0,0,-33/2]) cylinder(r=2.75,h=33);
      rotate([0,95,0]) translate([2,0,-33/2+2]) cylinder(r=2.75,h=10);
      rotate([0,95,180]) translate([2,0,-33/2+2]) cylinder(r=2.75,h=10);
      // rotate([0,90,0]) translate([0,0,-33/2+1]) cylinder(r2=3.5,r1=2.75,h=10);
      // rotate([0,-90,0]) translate([0,0,-33/2+1]) cylinder(r2=3.5,r1=2.75,h=10);

      /* cockpit and projection thereof */
      translate([0,0,-1]) sphere(r=6.5);
      translate([0,0,-1]) cylinder(r=6.5,h=41/2+1);

      /* peg hole and back of cockpit */
      translate([0,4,41/4-2-0.5]) cube([10,8,41/2+4+1], center=true);
      translate([0,0,-12-1]) cylinder(r=2.5,h=12);
   }
}

/* panel() -- component of the blank
 */
module panel() {
   epsilon = 0.001;

   a = [0 - epsilon, 41/2];
   // b = [22.5/2, 41/2];
   b = [34/2, 41/2]; // was 33/2
   c = [34/2, 0];
   d = [22.5/2, -41/2];
   e = [0 - epsilon, -41/2];

   /* basic panel */
   rotate([0,0,-90]) rotate([90,0,0]) translate([0,0,-2.75])
   linear_extrude(height=5.5) {
      polygon(points=[a,b,c,d,e],paths=[[0,1,2,3,4,5,0]]);
      mirror([1,0,0]) polygon(points=[a,b,c,d,e],paths=[[0,1,2,3,4,5,0]]);
   }
}

/*
 * Local variables:
 *  mode: C
 *  c-indent-level: 4
 *  c-basic-offset: 4
 * End:
 *
 * vim: ts=8 sts=4 sw=4 expandtab
 */

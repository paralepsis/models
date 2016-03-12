/* b-wing-bin.scad
 *
 * Copyright (C) Robert B. Ross, 2016
 *
 * This software is released under the Creative Commons
 * Attribution-ShareAlike 4.0 International Public License.
 */

include <./bintools.scad>

// % translate([0,0,-5]) import("/Users/rross/Downloads/1_BWing_Medium.STL");

/* locations is a pair of triples, translate : rotate pairs
 */
locations = [[[0,-5.75,0], [0,0,0]]];

// harborFreightMediumFullHt(locations=locations) bWingBlank();

// bWingBlank();

difference() {
   bWingOutline();
   translate([2.5,-30,0]) cube([40,60,50]);
}

/* bWingOutline() -- test piece for outline
 */
module bWingOutline() {
   translate([0,0,34.5]) rotate([180,0,0]) {
      blankCutout(height=34.5 - 0.1, outlineScale=1.2) bWingBlank();
   }
}

/* bWingBlank()
 *
 * Notes:
 * - total height ought to be around 34mm
 */
module bWingBlank() {
   rotate([180,0,0]) translate([0,0,-34]) union() {
      /* backbone */
      difference() { 
         translate([0,0,28/2+6]) cube(center=true, [5,55,28]);
         translate([0,0,1]) rotate([-14,0,0])cube(center=true, [5.5,100,10]);
      }

      /* mount */
      translate([0,0,2.5]) rotate([-90,0,0]) cylinder(r=2.5,h=15);
      translate([-2.5,0,2.5]) cube([5,15,5]);

      /* cockpit */
      translate([0,13+15,5]) rotate([0,0,0]) cylinder(r=4,h=29);

      /* crosspiece */
      for (i=[0:1]) {
         mirror([i,0,0]) {
            translate([41/2,7+1.5,12]) cylinder(r=2,h=34-12);
            difference() {
               translate([0,7,8]) cube([41/2,3,26]);
               translate([-3,7-0.5,-2.5]) rotate([0,-13,0]) cube([30,4,8]);
            }
         }
      }

      /* engine, etc. */
      translate([0,12,5]) scale([1,21/10,1])  cylinder(r=6,h=34-5);

      /* bottom */
      translate([0,-29.5,13]) scale([1,0.8,1]) cylinder(r=3.5,h=34-13);
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

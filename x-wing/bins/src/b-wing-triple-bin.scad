/* b-wing-bin.scad
 *
 * Copyright (C) Robert B. Ross, 2016
 *
 * This software is released under the Creative Commons
 * Attribution-ShareAlike 4.0 International Public License.
 */

include <./bintools.scad>

/* locations is a pair of triples, translate : rotate pairs
 */
locations = [[[0,-25,0], [0,0,90]],
             [[0,0,0], [0,0,-90]],
             [[0,25,0], [0,0,90]]];

harborFreightLargeFullHt(locations,inset=0.5) bWingBlank();


// bWingBlank();

/*
difference() {
   bWingOutline();
   translate([2.5,-30,0]) cube([40,60,50]);
}
*/

/* bWingOutline() -- test piece for outline
 */
module bWingOutline() {
   translate([0,0,36.5]) rotate([180,0,0]) {
      blankCutout(height=35.5 - 0.1, outlineScale=1.2) bWingBlank();
   }
}

/* bWingBlank()
 *
 * Notes:
 * - total height ought to be around 35mm
 */
module bWingBlank() {
   rotate([180,0,0]) translate([0,0,-35]) union() {
      /* backbone */
      difference() { 
         translate([0,0,28/2+6+0.5]) cube(center=true, [5,55,29]);
         translate([0,0,1]) rotate([-14,0,0])cube(center=true, [5.5,100,10]);
      }

      /* mount */
      translate([0,-1,2.5]) rotate([-90,0,0]) cylinder(r=2.5,h=17);
      translate([-2.5,-1,2.5]) cube([5,17,5]);

      /* cockpit */
      translate([0,13+15,5]) rotate([0,0,0]) cylinder(r=5,h=30);

      /* crosspiece */
      for (i=[0:1]) {
         mirror([i,0,0]) {
            translate([41/2-1.25,7+1.5,12]) cylinder(r=2,h=34-11);
            difference() {
               translate([0,7,8]) cube([41/2,3,27]);
               translate([-3,7-0.5,-2.5]) rotate([0,-13,0]) cube([30,4,8]);
            }
         }
      }

      /* engine, etc. */
      translate([0,12,5]) scale([1,21/10,1])  cylinder(r=6,h=34-4);

      /* bottom */
      translate([0,-28.5,13]) scale([1,0.8,1]) cylinder(r=4,h=34-12);
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

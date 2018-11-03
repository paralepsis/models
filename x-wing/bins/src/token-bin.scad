/* medium-bins.scad
 *
 * Copyright (C) Robert B. Ross, 2016
 *
 * This software is released under the Creative Commons
 * Attribution-ShareAlike 4.0 International Public License.
 */

/* Note: Abusing roundBoxBottom() a lot in this source, to create whole
 *       forms for diff()'ing, etc.
 */

include <./bintools.scad>

/* Harbor Freight Medium
 * 46.5mm tall
 * 48.6mm tall with legs
 * 80mm wide, 77 bottom
 * 54mm length, 52 bottom
 */

/* Harbor Freight Small
 * 46.5mm tall
 * 48.6mm tall with legs
 * 54mm wide
 * 39.25mm length
 */

$fn=80;

if (1) difference() {
   hull() largeBin();

   translate([28,-13,1.2]) rotate([0,0,-90]) roundSlot();
   translate([28,13,1.2]) rotate([0,0,-90]) roundSlot();
   translate([28,-38.5,1.2]) rotate([0,0,-90]) roundSlot();
   translate([28,38.5,1.2]) rotate([0,0,-90]) roundSlot();

   translate([1,42.5,1.2]) rotate([0,0,0]) chargeSlot();
   translate([1,-42.5,1.2]) rotate([0,0,180]) chargeSlot();

   translate([-27,13.5,1.2]) rotate([0,0,90]) tlSlot();
   translate([-27,-13.5,1.2]) rotate([0,0,90]) tlSlot();
   translate([-27,-40.5,1.2]) rotate([0,0,90]) tlSlot();
   translate([-27,40.5,1.2]) rotate([0,0,90]) tlSlot();
}

// chargeSlot();
// tlSlot();
// roundSlot();

module roundSlot() {
   cylinder(d=23,h=51);
   translate([0,10,25.5]) cube([15,20, 51],center=true);
}

module chargeSlot() {
   cylinder(d=23.5,h=50);
   rotate([0,0,45]) translate([-17.5/2, -17.5/2, 0]) minkowski() {
      cube([17.5, 17.5, 50]);
      cylinder(r=2,h=1);
   }
   translate([0,10,25.5]) cube([15,20, 51],center=true);
}

module tlSlot() {
   rotate([0,0,45]) translate([-15.5/2, -15.5/2,0]) minkowski() {
      cube([15.5, 15.5, 50]);
      cylinder(r=2,h=1);
   }
   translate([0,10,25.5]) cube([15,20, 51],center=true);
}

module largeBin() {
   harborFreightLargeHalfHt(locations=[],inset=0.5,filled=0,cornerRad=3.75,
                             bottomThick=1.2);
   if (0) {
      roundShapedBox(xDimTop=54, yDimTop=80, xDimBottom=54,
                     yDimBottom=80, ht=46.5/2, wallThick=1.6);
      roundBoxBottom(xDim=53,yDim=78.5,ht=1.2);
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

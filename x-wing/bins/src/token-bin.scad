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

if (1) bin1();

// largeBin();


// top2();

module top2(hole=0) {
   difference() {
      translate([-44,0,21.3]) rotate([90,0,90]) linear_extrude(height=88) polygon(points=[[-51,0],[-49.75,2],[49.75,2],[51,0]]);

      if (hole == 1) {
         cylinder(r=9,h=40);
      }
   }
}

module top(hole=0) {
   difference() {
      translate([0,65,21.3]) {
         rotate([90,0,0]) linear_extrude(height=130)
            polygon(points=[[-35,0],[-33.75,2],[33.75,2],[35,0]]);
      }
      if (hole == 1) {
         cylinder(r=9,h=40);
      }
   }
}

module bin1Top() {
   scale([1,0.99,1]) intersection() {
      hull() largeBin();
      top2(hole=1);
   }
}

module bin1(top=0) {
   difference() {
      hull() largeBin();

      translate([29,-13,0.9]) rotate([0,0,-90]) roundSlot();
      translate([29,13,0.9]) rotate([0,0,-90]) roundSlot();
      translate([29,-38.5,0.9]) rotate([0,0,-90]) roundSlot();
      translate([29,38.5,0.9]) rotate([0,0,-90]) roundSlot();

      // translate([1,42.5,0.9]) rotate([0,0,0]) chargeSlot();
      // translate([1,-42.5,0.9]) rotate([0,0,180]) chargeSlot();
      translate([0,44,0.9]) rotate([0,0,0]) roundSlot();
      translate([0,-44,0.9]) rotate([0,0,180]) roundSlot();

      translate([-29,14.25,0.9]) rotate([0,0,90]) tlSlot();
      translate([-29,-11.85,0.9]) rotate([0,0,90]) tlSlot();
      translate([-29,-38.25,0.9]) rotate([0,0,90]) tlSlot();
      translate([-29,39.5,0.9]) rotate([0,0,90]) roundSlot();

      translate([0,0,0.9]) hull() {
         translate([0,-17,0]) cylinder(d=27,h=50);
         translate([0,17,0]) cylinder(d=27,h=50);
      }

      if (top) top2();
   }
}

// chargeSlot();
// tlSlot();
// roundSlot();

module roundSlot() {
   cylinder(d=20.5,h=51);
   translate([0,10,25.5]) cube([15,20, 51],center=true);
}

module oldChargeSlot() {
   cylinder(d=23.5,h=50);
   rotate([0,0,45]) translate([-17.5/2, -17.5/2, 0]) minkowski() {
      cube([17.5, 17.5, 50]);
      cylinder(r=2,h=1);
   }
   translate([0,10,25.5]) cube([15,20, 51],center=true);
}

module chargeSlot() {
   rotate([0,0,45]) translate([-15.5/2, -15.5/2,0]) minkowski() {
      cube([15.5, 15.5, 50]);
      cylinder(r=2,h=1);
   }
   translate([0,10,25.5]) cube([15,20, 51],center=true);
}

module tlSlot() {
   rotate([0,0,45]) translate([-13.5/2, -13.5/2,0]) minkowski() {
      cube([13.5, 13.5, 50]);
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

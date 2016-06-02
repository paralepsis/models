/* wall-1.scad
 *
 * Copyright (C) Robert B. Ross, 2016
 *
 * This software is released under the Creative Commons
 * Attribution-ShareAlike 4.0 International Public License.
 */

use <corrugatedwall.scad>
use <containerwall.scad>
use <dooropening.scad>
use <hole-1.scad>
use <hole-2.scad>
use <bigCube.scad>

if (1) {
   /* wall */
   cornerPost1();
   cornerPost2();
   frontWall();
}
else {
   /* base */
   base();
}

/* base */
module base() {
   translate([-2,5,0]) intersection() {
      translate([16,45,0]) rotate([0,0,-65]) scale([1.6,1.5,1]) hole1();
      translate([16,-45,0]) rotate([0,0,180-65]) scale([1.6,1.5,1]) hole1();
   }
}

/****** MODULES ******/

module cornerPost1() {
   rotate([6,0,0]) intersection() {
     translate([-40,0,0]) cube([8,8,60]);
     translate([-60,0,-40]) scale([1,1,0.2]) bigCube();
   }
}

module cornerPost2() {
   rotate([6,0,0]) intersection() {
     translate([60,0,0]) cube([8,8,60]);
     translate([0,0,-35]) scale([1,1,0.2]) bigCube();
   }
}

module frontWall() {
   rotate([6,0,0]) intersection() {
      translate([-40,0,0]) corWall(length=107,height=60);
      translate([20,-8,-13]) rotate([-90,0,0]) scale([2,1,5]) hole2();
   }
}


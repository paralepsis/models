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

// miscHole();

if (1) {
   /* wall */
   cornerPosts();
   frontWall();
}
if (0) {
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

module cornerPosts() {
   rotate([6,0,0]) intersection() {
     union() { 
        translate([-41,-1,0]) cube([8,8,60]);
        translate([57,-1,0]) cube([8,8,60]);
     }
     translate([-60,-1,-40]) rotate([0,-2,0]) scale([1,1,0.2]) bigCube();
   }
}

module frontWall() {
   rotate([6,0,0]) intersection() {
      translate([-40,0,0]) corWall(length=107,height=60);
      translate([20,-8,-13]) rotate([-90,0,0]) scale([2,1,5]) hole2();
   }
}

/* miscHole() -- hole I used to make wall-1b */
module miscHole() {
   rotate([6,0,0]) {
      translate([20,-8,-13]) rotate([120,0,0]) scale([1,1,5]) hole2();
   }
}



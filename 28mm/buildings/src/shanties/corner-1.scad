/* corner-1.scad
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

/* corner */
cornerPost();
frontWall();
rightWall();

/* base */
translate([18,35,0]) rotate([0,0,-65]) scale([1.5,1.5,1]) hole1();

/****** MODULES ******/

module cornerPost() {
   intersection() {
     translate([60,0,0]) cube([8,8,60]);
     translate([0,0,-25]) scale([1,1,0.2]) bigCube();
   }
}

module frontWall() {
   intersection() {
      union() {
         difference() {
            translate([-40,0,0]) containerWall(length=107,height=60);
            translate([0,0,0]) doorOpening(cutout=1);
         }
         translate([0,1.0,0]) doorOpening(cutout=0,angle=-1);
      }
      translate([30,-8,0]) rotate([-90,0,0]) scale([2,1,5]) hole2();
   }
}

module rightWall() {
 
   intersection() {
      translate([67,0,0]) rotate([0,0,90]) corWall(length=70,height=40);
      translate([75,18,-18]) rotate([-90,0,90]) scale([2,1,5]) hole2();
   }
}




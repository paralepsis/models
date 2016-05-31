/* shanty-1.scad
 *
 * Copyright (C) Robert B. Ross, 2016
 *
 * This software is released under the Creative Commons
 * Attribution-ShareAlike 4.0 International Public License.
 */

use <woodwall.scad>
use <corrugatedwall.scad>
use <containerwall.scad>
use <dooropening.scad>
use <hole-1.scad>
use <hole-2.scad>

/* define rough dimensions of the building */
bDepth=90;
bWidth=100;
bHeight=50;
$fn=20;

// % cube([bWidth,bDepth,bHeight]);

if (1) {
   /* complete building assembled */
   almostAll();
   leftWall();
   top();
}
else {
   /* parted out for printing */
   almostAll();

   /* put the left wall interior to the building and flat */
   translate([bDepth+15, bHeight+2+30, 0]) rotate([0,-90,90])
      translate([2,0,0]) leftWall();

   translate([-15,-bDepth+48,bDepth+20]) rotate([92.5,180,180]) translate([0,10,0]) top();
}

/****** MODULES ******/

/* almostAll() -- all the pieces that ought to be printed as a unit
 */
module almostAll() {
   difference() {
      union() {
         /* cornerposts */
         translate([0,0,0]) cube([8,8,bHeight+9]);
         translate([bWidth-8,0,0]) cube([8,8,bHeight+9]);
         translate([0,bDepth-8,0]) cube([8,8,bHeight+4]);
         translate([bWidth-8,bDepth-8,0]) cube([8,8,bHeight+4]);

         // leftWall();
         rightWall();
         backWall();
         frontWall();
      }

      /* cleanly difference off the top */
      top();
   }
}

/* left wall */
module leftWall() {
   intersection() {
      translate([2,bDepth-2,-2]) rotate([0,0,-90])
         woodWall(length=bDepth/2.25,height=bHeight+1,supports=0);
      translate([-3,0,0]) cube([5,bDepth,bHeight+2]);
   }

   translate([0,7.5,bHeight-5]) rotate([-1,0,0]) cube([2,bDepth-15,7]);
}

/* right wall */
module rightWall() { 
   difference() {
      /* flipped around, had to move 2mm in X */
      translate([bWidth+2,bDepth,0]) rotate([0,0,-90])
         containerWall2(length=bDepth,height=bHeight-0.75,littleFlat=0.1,ow=0.5,ot=1.0);
      translate([bWidth-1,30,20]) rotate([1,0,0]) cube([5,23,20]);
   }
   translate([bWidth-2,0,40]) rotate([2,0,0]) translate([0,1,0]) cube([2,bDepth-5,7]);
   translate([bWidth-2,0,8]) rotate([-1,0,0]) translate([0,1,0]) cube([2,bDepth-5,7]);
}

/* back wall */
module backWall() {
   translate([0,bDepth,0]) {
      difference() {
         translate([0,2,0]) containerWall(length=bWidth,height=bHeight,flat=4);
         // translate([70,-1,0]) cube([50,5,30]);
         // rotate([90,0,0]) translate([30,2,-3]) scale([0.4,0.5,1]) hole1();
      }
   }
}

/* front wall */
module frontWall() {
   difference() {
      corWall(length=bWidth,height=bHeight+3);
      translate([22,0,0]) doorOpening(cutout=1);
   
      if (0) {
         /* bullet holes */
         translate([72,3,32]) rotate([90,0,0]) cylinder(r=1.25,h=15);
         translate([79,3,23]) rotate([90,0,0]) cylinder(r=1.25,h=15);
         translate([86,3,35]) rotate([90,0,0]) cylinder(r=1.25,h=15);
         translate([99,3,36]) rotate([90,0,0]) cylinder(r=1.25,h=15);
         translate([92,3,39]) rotate([90,0,0]) cylinder(r=1.25,h=15);
         translate([90,3,26]) rotate([90,0,0]) cylinder(r=1.25,h=15);
         translate([94,3,16]) rotate([90,0,0]) cylinder(r=1.25,h=15);
      }
   }
   translate([22,1.5,0]) doorOpening(cutout=0,angle=-1);
}

/* top */
module top() {
   translate([0,-10,bHeight+9]) rotate([-93.0,0,0]) {
      difference() {
         corWallFlat(length=bWidth+9,height=bDepth+20);
      }
      translate([31,-0.9,53]) rotate([90,135,0]) linear_extrude(height=2.7)
         plank(length=43,seed=11);
   }
}


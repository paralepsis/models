/* shanty-2b.scad
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

/* define rough dimensions of the building */
bDepthB=120;
bWidthB=90;
bHeightB=65;
$fn=20;

shanty2B();

/* shanty2B() -- put this half of the building together */
module shanty2B() {
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
      translate([bDepthB+15, bHeightB+2+30, 0]) rotate([0,-90,90])
         translate([2,0,0]) leftWall();

      translate([-15,-bDepthB+48,bDepthB+20]) rotate([92.5,180,180]) translate([0,10,0]) top();
   }
}

/****** MODULES ******/

/* almostAll() -- all the pieces that ought to be printed as a unit
 */
module almostAll() {
   difference() {
      union() {
         /* cornerposts */
         translate([0,0,0]) cube([8,8,bHeightB+5]);
         translate([bWidthB-8,0,0]) cube([8,8,bHeightB+9]);
         translate([0,bDepthB-8,0]) cube([8,8,bHeightB+5]);
         translate([bWidthB-8,bDepthB-8,0]) cube([8,8,bHeightB+9]);

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
   translate([2,bDepthB-2,0]) rotate([0,0,-90]) {
      woodWall(length=bDepthB-4,height=bHeightB-1,supports=0);
   }
   translate([0,8,bHeightB-15]) cube([2,bDepthB-16,7]);
   translate([0,8,7]) cube([2,bDepthB-16,7]);
}

/* right wall */
module rightWall() { 
   difference() {
      /* flipped around, had to move 2mm in X */
      translate([bWidthB+2,bDepthB,0]) rotate([0,0,-90])
         containerWall2(length=bDepthB,height=bHeightB-0.75,littleFlat=0.1,ow=0.5,ot=1.0);
      translate([bWidthB-1,30,20]) rotate([1,0,0]) cube([5,23,20]);
   }
   translate([bWidthB-2,0,40]) rotate([2,0,0]) translate([0,1,0]) cube([2,bDepthB-5,7]);
   translate([bWidthB-2,0,8]) rotate([-1,0,0]) translate([0,1,0]) cube([2,bDepthB-5,7]);
}

/* back wall */
module backWall() {
   translate([0,bDepthB,0]) {
      difference() {
         translate([0,2,0]) corWall(length=bWidthB,height=bHeightB);
         translate([70,-1,0]) cube([50,5,30]);
         rotate([90,0,0]) translate([30,2,-3]) scale([0.4,0.5,1]) hole1();
      }
      translate([70,2,0]) containerWall(length=50,height=30,flat=5);
      translate([9,1,0]) difference() {
         rotate([0,2,0]) cube([43,2,20]);
         translate([0,-1,-3]) cube([45,5,3]);
      }
   }
}

/* front wall */
module frontWall() {
   difference() {
      simpleContainerWall(length=bWidthB,height=bHeightB+3);
      translate([22,0,0]) doorOpening(cutout=1);
   
      /* bullet holes */
      translate([72,3,32]) rotate([90,0,0]) cylinder(r=1.25,h=15);
      translate([79,3,23]) rotate([90,0,0]) cylinder(r=1.25,h=15);
      translate([86,3,35]) rotate([90,0,0]) cylinder(r=1.25,h=15);
      translate([99,3,36]) rotate([90,0,0]) cylinder(r=1.25,h=15);
      translate([92,3,39]) rotate([90,0,0]) cylinder(r=1.25,h=15);
      translate([90,3,26]) rotate([90,0,0]) cylinder(r=1.25,h=15);
      translate([94,3,16]) rotate([90,0,0]) cylinder(r=1.25,h=15);
   }
   translate([22,1.5,0]) doorOpening(cutout=0,angle=3);
}

/* top */
module top() {
   translate([-10,-10,bHeightB+4]) rotate([-90,-2.5,0]) {
      difference() {
         corWallFlat(length=bWidthB+19,height=bDepthB+20);
         rotate([90,0,0]) translate([90,70,-1]) scale([0.4,0.5,1]) hole1();
      }
      translate([70,-0.9,43]) rotate([90,25,0]) linear_extrude(height=2.7)
         plank(length=60,seed=35);
      translate([75,-0.9,33]) rotate([90,32,0]) linear_extrude(height=2.7)
         plank(seed=3);
      translate([61,-0.9,53]) rotate([90,25,0]) linear_extrude(height=2.7)
         plank(length=63,seed=11);
   }
}


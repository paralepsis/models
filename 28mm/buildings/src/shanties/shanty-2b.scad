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
use <hole-2.scad>

/* define rough dimensions of the building */
bDepthB=120;
bWidthB=90;
bHeightB=62;
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
   translate([-2,0,0]) rotate([0,0,90]) difference() {
      union() {
         simpleContainerWall(length=bDepthB,height=30);
         translate([0,0,30]) containerWallFlat(length=bDepthB,
                                               height=bHeightB-1-30,
                                               bigFlat=6,
                                               littleFlat=0.5,thick=1.2);
      }

      /* difference out door opening */
      translate([62,0,0]) doorOpening(cutout=1);
   }
   translate([0,8,bHeightB-15]) cube([2,bDepthB-16,7]);
   // translate([0,8,7]) cube([2,bDepthB-16,7]);

   translate([-2,0,0]) rotate([0,0,90]) translate([62,1.5,0])
      doorOpening(cutout=0,angle=1);
}

/* right wall */
module rightWall() { 
   difference() {
      /* flipped around, had to move 2mm in X */
      translate([bWidthB+2,bDepthB,0]) rotate([0,0,-90])
         containerWall(length=bDepthB,height=bHeightB+7,littleFlat=0.1,ow=0.5,ot=1.0);
      translate([bWidthB-2,35,-0.25]) cube([7,bDepthB-35,53]);
   }
}

/* back wall */
module backWall() {
   translate([bWidthB,bDepthB,0]) rotate([0,0,180])
      woodWall(length=bWidthB-4,height=bHeightB,missing1=7);
}

/* front wall */
module frontWall() {
   difference() {
      simpleContainerWall(length=bWidthB,height=bHeightB+3);
      translate([43,0,12]) scale([0.6,3,0.5]) rotate([90,180,0]) hole2();
   }

}

/* top */
module top() {
   /* TODO: Simplify this set of translations! */
   translate([-10,-10,bHeightB+4]) rotate([-90,-2.5,0]) {
      translate([0,0,bWidthB+48]) rotate([0,90,0])
         corWallFlat(length=bDepthB+18,height=bWidthB+20);
   }
}


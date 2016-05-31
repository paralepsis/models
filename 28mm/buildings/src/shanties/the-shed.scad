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

/* define rough dimensions of the building */
bDepth=93;
bWidth=110;
bHeight=57;
$fn=20;

// % cube([120,100,bHeight]);

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
         translate([0,0,0]) cube([8,8,bHeight+7.5]);
         translate([bWidth-8,0,0]) cube([8,8,bHeight+7.5]);
         translate([0,bDepth-8,0]) cube([8,8,bHeight+4]);
         translate([bWidth-8,bDepth-8,0]) cube([8,8,bHeight+4]);

         /* crosspieces */
         translate([8,1,bHeight-1]) cube([bWidth-16, 3, 7]);
         translate([8,bDepth-4,bHeight-5]) cube([bWidth-16, 3, 7]);

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
   translate([2,bDepth-2,0]) rotate([0,0,-90]) {
      woodWall(length=bDepth-4,height=bHeight-1,supports=0,missing1=3,missing2=4);
   }
   translate([0,8,bHeight-15]) cube([2,bDepth-16,7]);
   translate([0,8,7]) cube([2,bDepth-16,7]);
}

/* right wall */
module rightWall() { 
   /* flipped around, had to move 2mm in X */
   translate([bWidth+4,bDepth,0]) rotate([0,0,-90])
      woodWall(length=bDepth-4,height=bHeight-1,supports=0,missing1=9);
   /* crosspieces */
   translate([bWidth-2,0,40]) rotate([2,0,0]) translate([0,1,0]) cube([2,bDepth-2,7]);
   translate([bWidth-2,0,8]) rotate([-1,0,0]) translate([0,1,0]) cube([2,bDepth-2,7]);
}

/* back wall */
module backWall() {
   translate([0,bDepth,0]) difference() {
      translate([0,2,0]) corWall(length=bWidth,height=bHeight);
      translate([50,0,42]) rotate([90,40,0]) translate([30,2,-3]) scale([0.07,0.3,1]) hole1();
   }
}

/* front wall */
module frontWall() {
}

/* top */
module top() {
   translate([-5,-5,bHeight+10]) rotate([-92.5,0,0]) translate([bWidth+10,0,0])
      rotate([0,0,180]) containerWallFlat(height=bDepth+10,length=bWidth+10,
                                          bigFlat=6, littleFlat=0.5,thick=1.2);
}


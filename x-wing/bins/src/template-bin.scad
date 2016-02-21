/* template-bin.scad
 *
 * Copyright (C) Robert B. Ross, 2016
 *
 * This software is released under the Creative Commons
 * Attribution-ShareAlike 4.0 International Public License.
 */

$fn=20;

include <./bintools.scad>

/* Harbor Frieght Medium
 * 46.5mm tall
 * 48.6mm tall with legs
 * 80mm wide, 77 bottom
 * 54mm length, 52 bottom
 */

leftSide();
translate([5,0,0]) rightSide();

module rightSide() {
   intersection() {
      templateBin();
      translate([40,-40,-0.5]) cube([200,80,50]);
   }
}
module leftSide() {
   difference() {
      templateBin();
      translate([40,-40,-0.5]) cube([200,80,50]);
   }
}

module templateBin() {
   difference() {
      union() {
         /* abusing roundBoxBottom() to make entire box shape */
         roundBoxBottom(xDim=240, yDim=54, ht=46.5/2);
      }
      translate([0,0,1.5]) roundBoxBottom(xDim=77, yDim=51, ht=46.5/2);
      translate([80,0,1.5]) roundBoxBottom(xDim=77, yDim=51, ht=46.5/2);
      translate([-80,0,1.5]) roundBoxBottom(xDim=77, yDim=51, ht=46.5/2);
      translate([0,0,24+1.5]) cube([200,40,48],center=true);
   }
   // roundBoxBottom(xDim=240,yDim=54,ht=1.2);
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

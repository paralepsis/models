/* long-bits-bin.scad
 *
 * Copyright (C) Robert B. Ross, 2016
 *
 * This software is released under the Creative Commons
 * Attribution-ShareAlike 4.0 International Public License.
 */

/* Note: Abusing roundBoxBottom() a lot in this source, to create whole
 *       forms for diff()'ing, etc.
 */

$fn=80;

include <./bintools.scad>

/* Harbor Freight Medium
 * 46.5mm tall
 * 48.6mm tall with legs
 * 80mm wide, 77 bottom
 * 54mm length, 52 bottom
 */

/* Card with Sleeve
 * 46x68mm seems like a good slot size
 */

difference() {
   union() {
      /* abusing roundBoxBottom() to make entire box shape */
      roundBoxBottom(xDim=80, yDim=54, ht=46.5/2, cornerRad=3.75);
   }
   /* center section, for cards */
   difference() {
      translate([0,0,1.5]) roundBoxBottom(xDim=77, yDim=50, ht=46.5/2, cornerRad=3.75);
      translate([0,0,46.5/4+1.8]) cube([77,28, 46.5/2], center=true);
      translate([0,0,46.5/4+1.8]) cube([54,50, 46.5/2], center=true);
   }
   /* actual space for the cards 68x46 */
   translate([0,0,46.5/4+1.8]) cube([68,46, 46.5/2], center=true);

   /* card access from the sides */
   translate([0,-30,12.5+1.8]) rotate([-90,0,0]) cylinder(r=12.5,h=60);
   translate([0,0,15+12.5+1.8]) cube([25,60,30],center=true);
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

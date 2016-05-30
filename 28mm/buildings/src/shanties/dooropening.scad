/* dooropening.scad
 *
 * Copyright (C) Robert B. Ross, 2016
 *
 * This software is released under the Creative Commons
 * Attribution-ShareAlike 4.0 International Public License.
 */

doorOpening();

/* doorOpening() -- create an opening where a door would go.
 *
 * cutout -- rather than creating the door with frame, creates a hull that
 *           can be used to diff out of a wall.
 *
 * NOTE: Positioned so that left back bottom corner of opening is at origin
 */
module doorOpening(width=32, height=45, thick=7, angle=2, cutout=0) {
   slop = 2;

   if (cutout) {
      translate([0,-thick,-0.1]) cube([width,thick+1,height+slop]);
   }
   else {
      translate([-3,-thick,0]) cube([3, thick, height+slop]);
      translate([width,-thick,0]) cube([3, thick, height+slop]);

      translate([-6,-thick,height]) rotate([0,-angle,0])
         cube([width+12,thick,3]);
   }
}

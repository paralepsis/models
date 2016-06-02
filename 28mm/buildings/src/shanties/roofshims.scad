/* roofshims.scad
 *
 * Copyright (C) Robert B. Ross, 2016
 *
 * This software is released under the Creative Commons
 * Attribution-ShareAlike 4.0 International Public License.
 */

$fn=50;
slop = 0.1;

roofShim();

module roofShim() {
   difference() {
      cylinder(r1=7,r2=6.5,h=1.2);

      translate([0,0,0.3]) cylinder(r2=6.8,r1=4,h=1.2);
      translate([0,0,1.9]) cube([8+slop,8+slop,4],center=true);
   }
}

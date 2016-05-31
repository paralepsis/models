/* shanty-1.scad
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

frontWall();
translate([60,0,0]) cube([8,8,60]);

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




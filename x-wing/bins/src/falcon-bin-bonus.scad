/* falcon-bin-bonus.scad
 *
 * Copyright (C) Robert B. Ross, 2016
 *
 * This software is released under the GNU General Public License 
 * Version 3. 
 */

include <bintools.scad>
use <../../bases/src/large-base.scad>
use <falcon-bin.scad>

/* Harbor Freight Large
 * 46.5mm tall
 * 48.6mm tall with legs
 * 109.3mm wide
 * 80mm length
 *
 * Note: doubling this, half height
 */

falconBox();

/* add in E-Wing */
if (0) {
   translate([57,-24,0]) rotate([0,0,-90]) difference() {
      blankOutline(height=46.5-0.1) import("../orig/e-wing-blank.stl");
      translate([0,0,46.5]) mirror([0,0,1]) import("../orig/e-wing-blank.stl");
   }
}

/* add in A-Wing */
if (1) {
   translate([62.5,-20,0]) rotate([0,0,0]) difference() {
      blankOutline(height=46.5-0.1) import("../orig/a-wing-blank-mod.stl");
      translate([0,0,46.5]) mirror([0,0,1]) import("../orig/a-wing-blank-mod.stl");
   }
}

/* add in X-Wing -- can't seem to make this work! */
if (0) {
   translate([62.5,-10,0]) rotate([0,0,53.0]) difference() {
      blankOutline(height=46.5-0.1) import("../orig/x-wing-blank.stl");
      translate([0,0,46.5]) mirror([0,0,1]) import("../orig/x-wing-blank.stl");
   }
}

/*
 * Local variables:
 *  mode: C
 *  c-indent-level: 3
 *  c-basic-offset: 3
 * End:
 *
 * vim: ts=8 sts=3 sw=3 expandtab
 */

/* falcon-bin-bonus.scad
 *
 * Copyright (C) Robert B. Ross, 2016
 *
 * This software is released under the GNU General Public License 
 * Version 3. 
 */

include <bintools.scad>
use <../../bases/src/large-base.scad>
use <x-wing-bin.scad>

/* Harbor Freight Large
 * 46.5mm tall
 * 48.6mm tall with legs
 * 109.3mm wide
 * 80mm length
 *
 * Note: doubling this, half height
 */

// simpleFalconBox();
betterFalconBox();
// falconOutline();

/* add in E-Wing */
if (0) {
   translate([56,-24,0]) rotate([0,0,-90]) difference() {
      blankOutline(height=46.5-0.1) import("../orig/e-wing-blank.stl");
      translate([0,0,46.5]) mirror([0,0,1]) import("../orig/e-wing-blank.stl");
   }
}

/* add in A-Wing */
if (0) {
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

// translate([-36,0,44]) rotate([180,0,0]) largeBase();

/* betterFalconBox()
 */
module betterFalconBox() {
   if (1) {
      roundShapedBox(xDimTop=160, yDimTop=109.3, xDimBottom=160,
                     yDimBottom=109.3, ht=46.5, wallThick=2.0);
      roundBoxBottom(xDim=160,yDim=109.3,ht=1.5);
   }

   translate([-12,9.5,0]) rotate([0,0,26.5]) falconEnclosure();
}

/* falconEnclosure()
 *
 * Notes:
 * - standard wall thickness is 1.2mm
 * - Total height of Falcon is around 36mm.
 * - Total height of outline is 46.5 - 0.1 mm.
 * - Posts need to be about 6mm tall to keep post and bottom gun off the base.
 */
module falconEnclosure() {
   postHeight = (46.5 - 0.1) - 36+6;

   falconOutline();

   /* posts */
   translate([17-14,18,0]) post(height=postHeight,topRad=7,bottomRad=8);
   translate([17-14,-18,0]) post(height=postHeight,topRad=7,bottomRad=8);

   translate([-23-14,18,0]) post(height=postHeight,topRad=7,bottomRad=8);
   translate([-23-14,-18,0]) post(height=postHeight,topRad=7,bottomRad=8);
}

module post(height=20,topRad=4,bottomRad=7) {
   hull() {
      translate([0,0,height-topRad/2]) scale([2,2,1]) sphere(r=topRad/2);
      cylinder(r=bottomRad,h=0.1);
   }
}

/* falconOutline() -- cut a slice out of the original case to use as
 *                    outline of the Falcon.
 *
 * Note: -17 is a nice translation to get a good cut.
 */
module falconOutline(height=46.5-0.1) {
   // linear_extrude(height=46.5-40.1) projection() falconShell();
   translate([0,-1.75,0]) linear_extrude(height=height)
      projection(cut=true) translate([0,0,-17])
      rotate([0,0,90]) import("../orig/falcon-outline-bottom.stl");
}

/* falconShell()
 *
 * Note:
 * - Height of STL is 40.25mm
 */
module falconShell() {
   rotate([0,0,90]) import("../orig/falcon-outline-bottom.stl");
   translate([-14.5,1.5,0]) cylinder(r=31,h=2.5);
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

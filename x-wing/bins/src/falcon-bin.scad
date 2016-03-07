/* huge-bin.scad
 *
 * Copyright (C) Robert B. Ross, 2016
 *
 * This software is released under the Creative Commons
 * Attribution-ShareAlike 4.0 International Public License.
 */

include <bintools.scad>
use <../../bases/src/large-base.scad>

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

// translate([-36,0,44]) rotate([180,0,0]) largeBase();

/* betterFalconBox()
 *
 * Notes:
 * - standard wall thickness is 1.2mm
 */
module betterFalconBox() {
   roundShapedBox(xDimTop=160, yDimTop=109.3, xDimBottom=160,
                  yDimBottom=109.3, ht=46.5, wallThick=2.0);
   roundBoxBottom(xDim=160,yDim=109.3,ht=1.5);
   falconOutline();

   /* posts */
   translate([20,34,0]) post(height=23);
}

module post(height=20,topRad=4,bottomRad=7) {
   hull() {
      translate([0,0,height-topRad/2]) scale([2,2,1]) sphere(r=topRad/2);
      cylinder(r=bottomRad,h=0.1);
   }
}

/* falconOutline() -- cut a slice out of the original case to use as
 *                    outline of the Falcon.
 */
module falconOutline(height=46.5-0.1) {
   // linear_extrude(height=46.5-40.1) projection() falconShell();
   translate([0,-1.75,0]) linear_extrude(height=height) projection(cut=true) translate([0,0,-17])
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

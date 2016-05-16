/* lambda-bin.scad
 *
 * Copyright (C) Robert B. Ross, 2016
 *
 * This software is released under the Creative Commons Attribution
 * -ShareAlike 4.0 International Public License.
 */

include <./bintools.scad>

$fn=160;
binHeight = 46.5/2;
angle=0;

/* locations is a pair of triples, translate : rotate pairs
 */
locations = [[[-36.5,22.5,0], [0,0,0]]];

intersection() {
   harborFreightLargeFullHt(locations,inset=1) lambdaBlank();
   hull() harborFreightLargeFullHt(locations,inset=1);
}

// lambdaBlank();
// lambdaOutline();

/* lambdaOutline() -- test piece for outline
 */
module lambdaOutline() {
   translate([0,0,10]) rotate([180,0,0]) {
      blankCutout(height=10, outlineScale=1.2) lambdaBlank();
   }
}

// 19 height is the real number. 5/7/2016
// 9mm under nose would be good.

module lambdaBlank(centerCutout=1) {
   blankHeight = 45;
   
   /* rotate, etc. positions blank upside-down on XY plane */
   rotate([180,0,0]) translate([0,0,-binHeight]) union() {
      translate([0,0,binHeight- (blankHeight)]) difference() {
         linear_extrude(height=blankHeight) lambdaShell();
         bottomAngleCutout();
      }
      // if (centerCutout) linear_extrude(height=binHeight) centerCutoutPoly();
   } /* rotate, translate, union */
}

/* lambdaShell() -- outline */
module lambdaShell() {
      polygon(points=[[-1.5,25], [9,75], [11+22,75], [59,34], [52,25], [52,21],
                      [75,12], [75,7], [40,6], [40,0], [32,0],[32,6], [4,6]]);
/*
      polygon(points=[[0,25], [11,75], [11+22,75], [59,32], [52,23], [52,19],
                      [75,10], [75,6], [40,6], [40,0], [32,0],[32,6], [4,6]]);
*/
}

/* bottomAngleCutout() -- defines the "height" of the bottom of the blank,
 *                        where it touches the model.
 *
 * Notes:
 * - "height" in the linear extrude corresponds to the width of the model
 *   in the X dimension.
 */
module bottomAngleCutout() {
   width = 80;

   rotate([0,0,90]) translate([0,2,0]) rotate([90,0,0]) linear_extrude(height=width)
      polygon(points=[[-1,0], [26,0], [73,19], [76,19], [76,-1], [-1,-1]]);
}

/* centerCutoutPoly() -- defines a polygon to be cut all the way to the
 *                       bottom of the bin.
 */
module centerCutoutPoly() {
   hull() {
      translate([0,-8,0]) circle(r=3.5);
      translate([0,15,0]) circle(r=3.5);
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

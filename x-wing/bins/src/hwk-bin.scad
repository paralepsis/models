/* hwk-bin.scad
 *
 * Copyright (C) Robert B. Ross, 2016
 *
 * This software is released under the Creative Commons Attribution
 * Non-Commercial License. It is derived from the model by RonPossible:
 * as downloaded on 4/29/2016 from the following URL:
 *   http://www.thingiverse.com/thing:1377445
 *
 * Specifically, the outline of the HWK was extracted from 
 * RonPossible's model.
 */

include <./bintools.scad>

$fn=160;
binHeight = 46.5/2;
angle=0;

/* locations is a pair of triples, translate : rotate pairs
 */
locations = [[[0,-6.5,0], [0,0,0]]];

// harborFreightMediumHalfHt(locations,inset=1) hwkBlank();

hwkBlank();
// hwkOutline();

/* hwkOutline() -- test piece for outline
 */
module hwkOutline() {
   translate([0,0,46.5/2]) rotate([180,0,0]) {
      blankCutout(height=46.5/2 - 0.1, outlineScale=1.2) hwkBlank();
   }
}

// 19 height is the real number. 5/7/2016
// 9mm under nose would be good.

module hwkBlank(centerCutout=1) {
   blankHeight = 19;
   
   /* rotate, etc. positions blank upside-down on XY plane */
   rotate([180,0,0]) translate([0,0,-binHeight]) union() {
      translate([0,0,binHeight- (blankHeight)]) difference() {
         linear_extrude(height=blankHeight) hwkShell();
         bottomAngleCutout();
      }
      if (centerCutout) linear_extrude(height=binHeight) centerCutoutPoly();
   } /* rotate, translate, union */
}

/* hwkShell() -- outline */
module hwkShell() {
   for (i=[0:1]) mirror([i,0,0]) 
      polygon(points=[[0,-33.0],[-9,-33.0], [-23.1,-31.5],[-24.1,-30.5],
         [-25.4,-14.6],[-24.5,-13.5],[-8.1,-12.1], [-6.5,-10.2],[-6.5,0.5],
         [-5.5,2.23],[-4.95,16.3],[-2.1,31.5],[0,31.5]]);
}

/* bottomAngleCutout() -- defines the "height" of the bottom of the blank,
 *                        where it touches the model.
 *
 * Notes:
 * - "height" in the linear extrude corresponds to the width of the model
 *   in the X dimension.
 */
module bottomAngleCutout() {
   width = 60;

   rotate([0,0,90]) translate([0,width/2,0]) rotate([90,0,0]) linear_extrude(height=width)
      polygon(points=[[-34,0], [-10,0], [2,4], [34, 8], [32,-1], [-32,-1]]);
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

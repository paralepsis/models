/* kihraxz-bin.scad
 *
 * Copyright (C) Robert B. Ross, 2016
 *
 * This software is released under the Creative Commons
 * Attribution-ShareAlike 4.0 International Public License.
 */

include <./bintools.scad>

$fn=160;

/* locations is a pair of triples, translate : rotate pairs
 */
kLocations = [[[24.5,17.0,0], [0,0,90]],
             [[-24.5,-17.0,0], [0,0,-90]]];

harborFreightMediumHalfHt(kLocations,inset=1,bottomThick=0.9) kBlank();

// kBlank();
// kOutline();

/* kOutline() -- test piece for outline
 */
module kOutline() {
   translate([0,0,14.9]) rotate([180,0,0]) {
      blankCutout(height=15 - 0.1, outlineScale=1.2) kBlank();
   }
}

module kBlank(centerCutout=1, useProfile=1) {
   binHeight = 46.5/2;
   blankHeight = 14.0; // this is the height of the region supporting ship
   
   /* rotate, etc. positions blank upside-down on XY plane */
   union() {
      translate([0,0,0]) intersection() {
         linear_extrude(height=blankHeight) kShell();
         if (useProfile) kProfile(h=blankHeight);
      }
      if (centerCutout) linear_extrude(height=binHeight) kCutoutPoly();
   } /* rotate, translate, union */
}

/* kShell() -- exterior outline */
module kShell() {
   for (j=[0:1]) mirror([j,0,0])
      polygon(points=[
                     [-0.1,1.5], [2,1.5], [2,4], [8,6.25], [9.5,1], [13.5,1],
                     [15,7], [15,9], [18,9], [18,11], [20.5,12], [20.5,16],
                     [18,17], [17,24], [6,25], [5.5,31], [3,31], [3,33.5],
                     [4,33.5], [2,49], [-0.1,49]
                     ]);
}

/* kProfile() - defines the side profile of the blank (not cutout)
 */
module kProfile(h=100,w=200)
{
   translate([-1*w/2,0,0]) rotate([90,0,90]) linear_extrude(height=w) {
      polygon(points=[
                     [0,0], [49,0], [49,8], [25,8], [25,h], [0,h]
                     ]);
   }

}

/* kCutoutPoly() -- defines a polygon to be cut all the way to the
 *                     bottom of the bin.
 *
 */
module kCutoutPoly() {
   for (j=[0:1]) mirror([j,0,0])
      polygon(points=[
                     [-0.1,0], [7,0], [7,25], [-0.1,25]
                     ]);
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

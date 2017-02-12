/* tie-striker-bin.scad
 *
 * Copyright (C) Robert B. Ross, 2017
 *
 * This software is released under the Creative Commons
 * Attribution-ShareAlike 4.0 International Public License.
 */

include <./bintools.scad>

$fn=160;
binHeight = 46.5/2;
blankHeight = 18.0; // this is the height of the region supporting ship
   

/* locations is a pair of triples, translate : rotate pairs
 */
// sLocations = [[[2.25,-29,0], [0,0,23]]];
sLocations = [[[0,-31,0], [0,0,0]]];

harborFreightMediumHalfHt(sLocations,inset=1,bottomThick=0.9) sBlank();

// sBlank();
// sOutline();

/* sOutline() -- test piece for outline
 */
module sOutline() {
   translate([0,0,14.9]) rotate([180,0,0]) {
      blankCutout(height=15 - 0.1, outlineScale=1.2) sBlank();
   }
}

module sBlank(centerCutout=1, useProfile=1) {
   /* rotate, etc. positions blank upside-down on XY plane */
   union() {
      translate([0,0,0]) intersection() {
         linear_extrude(height=blankHeight) sShell();
         if (useProfile) sProfile(s=blankHeight);
      }

      /* I only want the peg to just sit flush in this case */
      if (centerCutout) linear_extrude(height=18) sCutoutPoly();
   } /* rotate, translate, union */
}

/* sShell() -- exterior outline */
module sShell() {
   for (j=[0:1]) mirror([j,0,0])
      polygon(points=[[0,0], [4,0], [4,-7], [6,-7], [21,5], [21,20], [5,58],
                      [4,58], [4,23.5], [0,23.5]]);
}

/* sProfile() - defines the side profile of the blank (not cutout)
 */
module sProfile(w=200)
{
   translate([-1*w/2,0,0]) rotate([90,0,90]) linear_extrude(height=w) {
      polygon(points=[
                     [-7,0], [-7,5], [5,16], [20,16], [58,5], [58,0]
                     ]);
   }

}

/* sCutoutPoly() -- defines a polygon to be cut all the way to the
 *                     bottom of the bin.
 *
 */
module sCutoutPoly() {
   translate([0,21-7,0]) circle(r=3);
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

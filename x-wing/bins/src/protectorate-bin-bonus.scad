/* protectorate-bin.scad
 *
 * Copyright (C) Robert B. Ross, 2016
 *
 * This software is released under the Creative Commons
 * Attribution-ShareAlike 4.0 International Public License.
 */

include <./bintools.scad>
use <./kihraxz-bin.scad>

$fn=160;
binHeight   = 46.5/2;
angle=0;

/* locations is a pair of triples, translate : rotate pairs
 */
locations = [[[0,0,0], [0,0,0]]];

harborFreightMediumHalfHt(locations,inset=1,bottomThick=0.9) union() {
   translate([25,17.5,0]) rotate([0,0,90]) protBlank();
   translate([-24.5,-17.5,0]) rotate([0,0,-90]) kBlank();
}

/* protOutline() -- test piece for outline
 */
module protOutline() {
   translate([0,0,14.9]) rotate([180,0,0]) {
      blankCutout(height=15 - 0.1, outlineScale=1.2) protBlank();
   }
}

module protBlank(centerCutout=1, useProfile=1) {
   blankHeight = 8.0; // this is the height of the region supporting ship
   
   /* rotate, etc. positions blank upside-down on XY plane */
   union() {
      translate([0,0,0]) intersection() {
         linear_extrude(height=blankHeight) protShell();
         if (useProfile) protProfile(h=blankHeight);
      }
      if (centerCutout) linear_extrude(height=binHeight) protCutoutPoly();
   } /* rotate, translate, union */
}

/* protShell() -- exterior outline */
module protShell() {
   for (j=[0:1]) mirror([j,0,0])
      polygon(points=[
                     [-0.1,0], [5,0], [5,2], [14,2.5], [14,6.5], [20.75,7.5],
                     [20.75,14], [15,18], [11,42], [6.5,46], [6,35], [5,34],
                     [5,33], [-0.1,33]
                     ]);
}

/* protProfile() - defines the side profile of the blank (not cutout)
 */
module protProfile(h=100,w=200)
{
   translate([-1*w/2,0,0]) rotate([90,0,90]) linear_extrude(height=w) {
      polygon(points=[
                     [0,0], [46,0], [46,3], [8,h], [0,h]
                     ]);
   }

}

/* protCutoutPoly() -- defines a polygon to be cut all the way to the
 *                     bottom of the bin.
 *
 */
module protCutoutPoly() {
   for (j=[0:1]) mirror([j,0,0])
      polygon(points=[
                     [-0.1,0], [5,0], [5,2], [5,33], [-0.1,33]
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

/* quadjumper-bin.scad
 *
 * Copyright (C) Robert B. Ross, 2017
 *
 * This software is released under the Creative Commons
 * Attribution-ShareAlike 4.0 International Public License.
 */

include <./bintools.scad>

$fn=160;
binHeight   = 46.5;
angle=0;

/* locations is a pair of triples, translate : rotate pairs
 */
locations = [[[17,-6.75,0], [0,0,75]]];
  

harborFreightSmallFullHt(locations,inset=0.5,bottomThick=0.9) quadBlank();

// quadBlank();
// quadOutline();

/* quadOutline() -- test piece for outline
 */
module quadOutline() {
   translate([0,0,15]) rotate([180,0,0]) {
      blankCutout(height=15 - 0.1, outlineScale=1.2) quadBlank();
   }
}

module quadBlank(centerCutout=0, useProfile=0) {
   blankHeight = 39.0;
   
   /* rotate, etc. positions blank upside-down on XY plane */
   union() {
      translate([0,0,0]) intersection() {
         linear_extrude(height=blankHeight) quadShell();
         if (useProfile) quadProfile(h=blankHeight);
      }
      if (centerCutout) linear_extrude(height=binHeight) quadCutoutPoly();
   } /* rotate, translate, union */
}

/* quadShell() -- exterior outline */
module quadShell() {
   for (j=[0:1]) mirror([j,0,0])
      polygon(points=[
                     [-0.1,0], [4,0], [4,5.5], [9,7.5], [16,4],
                     [18,7], [12,11], [12,15],[15,19.5],[17,19.5],
                     [17,22], [26,26.5],[24.5,29],[15,25.5],[13,27.5],
                     [9.5,28],[8,27.5], [6,26],[3.5,28],[-0.1,28]
                     ]);
}

/* quadProfile() - defines the side profile of the blank (not cutout)
 */
module quadProfile(h=100,w=200)
{
   translate([-1*w/2,0,0]) rotate([90,0,90]) linear_extrude(height=w) {
      polygon(points=[
                     [0,0], [46,0], [46,3], [8,h], [0,h]
                     ]);
   }

}

/* quadCutoutPoly() -- defines a polygon to be cut all the way to the
 *                     bottom of the bin.
 *
 */
module quadCutoutPoly() {
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

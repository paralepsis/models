/* u-wing-bin.scad
 *
 * Copyright (C) Robert B. Ross, 2017
 *
 * This software is released under the Creative Commons
 * Attribution-ShareAlike 4.0 International Public License.
 *
 * Note: This is an ugly one -- not a great example.
 *
 * Thanks to RyanVito for his help with this bin!
 */

include <./bintools.scad>

$fn=160;
binHeight = 46.5/2;
blankHeight = 23; // VERY CLOSE!!!
angle=0;

/* locations is a pair of triples, translate : rotate pairs
 */
locations = [[[20,-39.5,0], [0,0,0]],
             [[-20,39.5,0],[0,0,180]]];

harborFreightLargeHalfHt(locations,bottomThick=0.9,inset=0.5) uwingBlank();

// uwingBlank();
// uwingOutline();

/* uwingOutline() -- test piece for outline
 */
module uwingOutline() {
   translate([0,0,blankHeight]) rotate([180,0,0]) {
      blankCutout(height=blankHeight - 0.1, outlineScale=1.2) uwingBlank();
   }
}

module uwingBlank(centerCutout=1) {
   
   /* rotate, etc. positions blank upside-down on XY plane */
   union() {
      difference() {
         linear_extrude(height=blankHeight) uwingShell();
         translate([0,0,2.75]) bottomAngleCutout(); // translate is kludge
      }
      if (centerCutout) linear_extrude(height=binHeight) centerCutoutPoly();
   } /* rotate, translate, union */
}

/* uwingShell() -- outline */
module uwingShell() {
   for (i=[0:1]) mirror([i,0,0]) 
      polygon(points=[[-0.1,0],[7,0],[10,-13],[15,-13],[17,-2],[17,13],
                      [12,13],[14,15],[14,38.5],[13,77],[8,77],[7.5,45],
                      [5.5,45],[5.5,48],[3,48],[-0.1,48]
                     ]);
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

   rotate([0,0,180]) translate([-width/2,-66,binHeight]) rotate([0,90,0]) linear_extrude(height=width)
      polygon(points=[[-0.1,-14],[17,-14],[17,30],[9,48],[9,80],[-0.1,80]]);
}

/* centerCutoutPoly() -- defines a polygon to be cut all the way to the
 *                       bottom of the bin.
 */
module centerCutoutPoly() {
   hull() {
      translate([0,9,0]) circle(r=3.5);
      translate([0,19,0]) circle(r=3.5);
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

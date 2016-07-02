/* starviper-bin.scad
 *
 * Copyright (C) Robert B. Ross, 2016
 *
 * This software is released under the Creative Commons Attribution
 * License. It is derived from the model by ThisIsDavin
 * as downloaded on 4/29/2016 from the following URL:
 *   http://www.thingiverse.com/thing:1515669
 *
 * Specifically, the outline of the Starviper was extracted from 
 * ThisIsDavin's model.
 */

include <./bintools.scad>

$fn=160;
binHeight   = 46.5;
angle=0;

/* locations is a pair of triples, translate : rotate pairs
 */
locations = [[[0,0,0], [0,0,0]]];

// harborFreightLargeHalfHt(locations,inset=1) starviperBlank();

// starviperBlank();
starviperOutline();

/* starviperOutline() -- test piece for outline
 */
module starviperOutline() {
   translate([0,0,40]) rotate([180,0,0]) {
      blankCutout(height=15 - 0.1, outlineScale=1.2) starviperBlank();
   }
}

module starviperBlank(centerCutout=1) {
   blankHeight = 42; 
   
   /* rotate, etc. positions blank upside-down on XY plane */
   rotate([180,0,0]) translate([0,0,-binHeight]) union() {
      difference() {
         translate([0,0,binHeight- (blankHeight-7)])
            linear_extrude(height=blankHeight-7) starviperShell();
         // translate([0,0,binHeight-blankHeight]) bottomAngleCutout();
      }
      if (centerCutout) linear_extrude(height=binHeight) centerCutoutPoly();
   } /* rotate, translate, union */
}

/* starviperShell() -- outline, adapted from Slannesh's model */
module starviperShell() {
   for (j=[0:1]) mirror([j,0,0])
   for (i=[0:1]) mirror([0,i/2,0]) 
      polygon(points=[[-0.1,-0.1], [9.5,-0.1], [9.5,5.16], [14.64,6.23],
                      [14.64,13],[19.85,12.1],[22,17.05], [19.7,23.41],
                      [19.6,33.5], [19.6,37], [14.95,37], [14.95,33.5],
                      [11.07,22.93], [9.9,22.93], [9.5,25],[-0.1,25]]);
}

/* bottomAngleCutout() -- defines the "height" of the bottom of the blank,
 *                        where it touches the model.
 *
 * NOTE: NOT USED FOR THIS MODEL. I'm simply trying to further refine my
 *       process.
 */
module bottomAngleCutout() {
   translate([0,52,0]) rotate([90,0,0]) linear_extrude(height=104)
      polygon(points=[[-75, 6.92], [-36.46, 12.69], [32.47, 27], [72.13,37],
                      [72,0], [-73.7,0]]);
}

/* centerCutoutPoly() -- defines a polygon to be cut all the way to the
 *                       bottom of the bin.
 *
 * NOTE: NOT USED FOR THIS MODEL.
 */
module centerCutoutPoly() {
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

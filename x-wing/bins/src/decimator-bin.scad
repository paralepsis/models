/* decimator-bin.scad
 *
 * Copyright (C) Robert B. Ross, 2016
 *
 * This software is released under the Creative Commons Attribution
 * Non-Commercial License. It is derived from the model by Slannesh
 * as downloaded on 3/5/2016 from the following URL:
 *   http://www.thingiverse.com/thing:1250010
 *
 * Specifically, the outline of the Decimator was extracted from 
 * Slannesh's model.
 */


include <./bintools.scad>

$fn=160;
binHeight   = 46.5;
angle=0;

/* locations is a pair of triples, translate : rotate pairs
 */
locations = [[[2,0,0], [0,0,0]]];

harborFreightHugeFullHt(locations,inset=1) decimatorBlank();

// decimatorBlank();
// decimatorOutline();

/* decimatorOutline() -- test piece for outline
 */
module decimatorOutline() {
   translate([0,0,40]) rotate([180,0,0]) {
      blankCutout(height=46.5 - 0.1, outlineScale=1.2) decimatorBlank();
   }
}

module decimatorBlank(centerCutout=1) {
   blankHeight = 42; 
   
   /* rotate, etc. positions blank upside-down on XY plane */
   rotate([180,0,0]) translate([0,0,-binHeight]) union() {
      difference() {
         translate([0,0,binHeight- (blankHeight-7)])
            linear_extrude(height=blankHeight-7) decimatorShell();
         translate([0,0,binHeight-blankHeight]) bottomAngleCutout();
      }
      if (centerCutout) linear_extrude(height=binHeight)
         decimatorBottom();
   } /* rotate, translate, union */
}

/* decimatorBottom() -- cutout in the middle bottom, to save plastic */
module decimatorBottom() {
   for (i=[0:1]) mirror([0,i,0]) 
      polygon(points=[[-75,0],[-75,20.6],
                      [26,18],[28,15],[34.3,11.25],[40,7.25],
                      [40,0]]);
}

/* decimatorShell() -- outline, adapted from Slannesh's model */
module decimatorShell() {
   for (i=[0:1]) mirror([0,i,0]) 
      polygon(points=[[-75,0],[-75,20.6],[-51,51],[-38.5,50],
                      [35.3,38.2],[69,24],[69,18],
                      [26,18],[28,15],[34.3,11.25],[40,7.25],
                      [40,0]]);
}

/* bottomAngleCutout() -- defines the "height" of the bottom of the blank,
 *                        where it touches the model.
 */
module bottomAngleCutout() {
   translate([0,52,0]) rotate([90,0,0]) linear_extrude(height=104)
      polygon(points=[[-75, 6.92], [-36.46, 12.69], [32.47, 27], [72.13,37],
                      [72,0], [-73.7,0]]);
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

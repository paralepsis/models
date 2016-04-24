/* yt-2400-bin.scad
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
locations = [[[0,0,0], [0,0,0]]];

// harborFreightHugeFullHt(locations,inset=1) angledDecimatorBlank();

// decimatorBlank();
decimatorOutline();


// % linear_extrude(height=2) decimatorShell0();
// decimatorShell();

/*
difference() {
   decimatorOutline();
   translate([2.5,-30,0]) cube([40,60,50]);
}
*/

module angledDecimatorBlank() {
   translate([-75,0,0]) rotate([0,5,0]) translate([75,0,0]) decimatorBlank();

   /* TODO: slice a projection and recreate the cutout in the middle */
}

/* decimatorOutline() -- test piece for outline
 */
module decimatorOutline() {
   translate([0,0,40]) rotate([180,0,0]) {
      blankCutout(height=34.5 - 0.1, outlineScale=1.2) decimatorBlank();
   }
}

module decimatorBlank(centerCutout=1) {
   blankHeight = 40; 
   
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

/* 7,11,15 heights from ground along side */

/* decimatorBottom() -- cutout in the middle bottom, I think */
module decimatorBottom() {
   for (i=[0:1]) mirror([0,i,0]) 
      polygon(points=[[-75,0],[-75,20.6],
                      [28.3,18],[30,15],[34.3,11.25],[41,5.25],
                      [41,0]]);
}

/* decimatorShell() -- outline, adapted from Slannesh's model */
module decimatorShell() {
   for (i=[0:1]) mirror([0,i,0]) 
      polygon(points=[[-75,0],[-75,20.6],[-51,51],[-38.5,50],
                      [35.3,38.2],[69.25,25.25],[70,24],[70,18],
                      [28.3,18],[30,15],[34.3,11.25],[41,5.25],
                      [41,0]]);
}

module bottomAngleCutout() {
   translate([-74,0,0]) rotate([0,-8.5,0]) translate([74,0,0])
   translate([0,52,0]) rotate([90,0,0]) linear_extrude(height=104)
      polygon(points=[[-74, 7], [-35, 7], [35.3, 11], [76,15],
                      [76,0], [-73.7,0]]);
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

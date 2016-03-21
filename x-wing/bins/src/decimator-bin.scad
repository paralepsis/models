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

/* locations is a pair of triples, translate : rotate pairs
 */
locations = [[[0,0,0], [0,0,0]]];

// harborFreightHugeFullHt(locations,inset=1) decimatorBlank();

// decimatorBlank();
decimatorOutline();

/*
difference() {
   decimatorOutline();
   translate([2.5,-30,0]) cube([40,60,50]);
}
*/

/* decimatorOutline() -- test piece for outline
 */
module decimatorOutline() {
   translate([0,0,33]) rotate([180,0,0]) {
      blankCutout(height=34.5 - 0.1, outlineScale=1.2) decimatorBlank();
   }
}

module decimatorBlank() {
   blankHeight = 24; 
   
   rotate([180,0,0]) translate([0,0,-binHeight]) union() {
      translate([0,0,blankHeight]) linear_extrude(height=blankHeight) decimatorShell();
      linear_extrude(height=binHeight) decimatorBottom();
   } /* rotate, translate, union */
}

module decimatorBottom() {
   for (i=[0:1]) mirror([0,i,0]) 
      polygon(points=[[-73.7,0],[-73.7,20.6],
                      [28.3,19.75],[28.3,11.25],[34.3,11.25],[40.3,5.25],
                      [40.3,0]]);
}
module decimatorShell() {
   for (i=[0:1]) mirror([0,i,0]) 
      polygon(points=[[-73.7,0],[-73.7,20.6],[-49.3,47.2],[-38.5,47.2],
                      [35.3,38.2],[69.25,25.25],[73.75,25.25],[73.75,19.75],
                      [28.3,19.75],[28.3,11.25],[34.3,11.25],[40.3,5.25],
                      [40.3,0]]);
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

/* protectorate-bin.scad
 *
 * Copyright (C) Robert B. Ross, 2016
 *
 * This software is released under the Creative Commons
 * Attribution-ShareAlike 4.0 International Public License.
 */

include <./bintools.scad>

$fn=160;
binHeight   = 46.5/2;
angle=0;

/* locations is a pair of triples, translate : rotate pairs
 */
locations = [[[1,28.5,0], [0,0,-30]],
             [[-1,-28.5,0], [0,0,150]]];

// harborFreightMediumHalfHt(locations,inset=1) protBlank();

// protBlank();
protOutline();

/* protOutline() -- test piece for outline
 */
module protOutline() {
   translate([0,0,40]) rotate([180,0,0]) {
      blankCutout(height=15 - 0.1, outlineScale=1.2) protBlank();
   }
}

module protBlank(centerCutout=0) {
   blankHeight = 28.5; 
   
   /* rotate, etc. positions blank upside-down on XY plane */
   rotate([180,0,0]) translate([0,0,-binHeight]) union() {
      difference() {
         translate([0,0,binHeight-blankHeight])
            linear_extrude(height=blankHeight) protShell();
      }
      if (centerCutout) linear_extrude(height=binHeight) protCutoutPoly();
   } /* rotate, translate, union */
}

/* protShell() -- exterior outline */
module protShell() {
   for (j=[0:1]) mirror([j,0,0])
      polygon(points=[
                     [-0.1,0], [6,0], [6,1.5], [14,2], [14,6], [21,7],
                     [21,14], [15,18], [11,42], [6.5,46], [6,35], [5,34],
                     [5,33], [-0.1,33]
                     ]);
}

/* protCutoutPoly() -- defines a polygon to be cut all the way to the
 *                     bottom of the bin.
 *
 */
module protCutoutPoly() {
   for (j=[0:1]) mirror([j,0,0])
      polygon(points=[[-0.1,-0.1], [9.5,-0.1], [9.5,5.16], [14.64,6.23],
                      [14.64,13],[19.85,12.1],[22,17.05],// [19.7,23.41],
                      // [19.6,33.5], [19.6,37], [14.95,37], [14.95,33.5],
                      // [11.07,22.93],
                     [9.9,22.93], [9.5,25],[-0.1,25]]);
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

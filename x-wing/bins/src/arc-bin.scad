/* arc-bin.scad
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

// harborFreightMediumHalfHt(locations,inset=1) arcBlank();

// arcBlank();
arcOutline();

/* arcOutline() -- test piece for outline
 */
module arcOutline() {
   translate([0,0,40]) rotate([180,0,0]) {
      blankCutout(height=15 - 0.1, outlineScale=1.2) arcBlank();
   }
}

module arcBlank(centerCutout=0) {
   blankHeight = 28.5; 
   
   /* rotate, etc. positions blank upside-down on XY plane */
   rotate([180,0,0]) translate([0,0,-binHeight]) union() {
      difference() {
         translate([0,0,binHeight-blankHeight])
            linear_extrude(height=blankHeight) arcShell();
      }
      if (centerCutout) linear_extrude(height=binHeight) arcCutoutPoly();
   } /* rotate, translate, union */
}

/* arcShell() -- exterior outline */
module arcShell() {
   for (j=[0:1]) mirror([j,0,0])
      polygon(points=[
                     [-0.1,0], [5,0], [6,4], [10,4], [13,12], [37,21],
                     [37,19], [42,19], [44,22], [44,29], [42,31], [42,50],
                     [37,50], [37,31], [14,31], [13,34], [5,34], [1.5,54],
                     [-0.1,54]
                     ]);
}

/* arcCutoutPoly() -- defines a polygon to be cut all the way to the
 *                     bottom of the bin.
 *
 */
module arcCutoutPoly() {
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

/* tie-tap-bin.scad
 *
 * Copyright (C) Robert B. Ross, 2016
 *
 * This software is released under the Creative Commons
 * Attribution-ShareAlike 4.0 International Public License.
 *
 */

include <./bintools.scad>
use <tie-phantom-bin.scad>

$fn=160;
binHeight   = 46.5;
blankHeight = 30;

/* locations is a pair of triples, translate : rotate pairs
 */
locations = [[[0,5,0], [0,0,0]],
             [[0,-24,0], [0,0,0]]];

if (0) {
   harborFreightSmallFullHt(locations,inset=0.5,bottomThick=0.9)
   intersection() {
      tapBlank();
      hull() harborFreightSmallFullHt(locations,inset=0.5,bottomThick=0.9); 
   }
}

/* Combination TAP/Phantom */
if (0) {
   intersection() {
      harborFreightSmallFullHt([[0,0,0],[0,0,0]],inset=0.5,bottomThick=0.9)
      union() {
         translate([0,5.5,0]) tapBlank();
         translate([0,-8,0]) rotate([0,0,90]) phantomBlank();
      }
      hull()
      harborFreightSmallFullHt([[0,0,0],[0,0,0]],inset=0.5,bottomThick=0.9);
   }
}

// tapOutline();
tapBlank();

/* tapOutline() -- test piece for outline
 */
module tapOutline() {
   blankCutout(height=18, outlineScale=1.2) tapBlank();
}

/* NOTE: Should be upside down on XY plane */
module tapBlank(centerCutout=1) {
   blankHeight = 30; 

   linear_extrude(height=blankHeight) tapShell();
}

/* tapShell() -- outline */
module tapShell() {
   for (i=[0:1]) mirror([i,0,0]) 
      polygon(points=[[-0.1,0],[33/2,0],[33/2,3], [33/2 +1.5,3],[33/2+1.5,16],
                      [33/2,16],[33/2,19], [-0.1,19]]);
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

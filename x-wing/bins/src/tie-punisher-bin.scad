/* tie-punisher-bin.scad
 *
 * Copyright (C) Robert B. Ross, 2016
 *
 * This software is released under the Creative Commons Attribution
 * Non-Commercial License. It is derived from the model by RonPossible:
 * as downloaded on 4/29/2016 from the following URL:
 * http://www.thingiverse.com/thing:1377445
 *
 * Specifically, the outline of the Punisher was extracted from 
 * RonPossible's model.
 */

include <./bintools.scad>

$fn=160;
binHeight = 46.5;
angle=0;

/* locations is a pair of triples, translate : rotate pairs
 */
locations = [[[0,9,0], [0,0,0]]];

// harborFreightMediumFullHt(locations,inset=1) punisherBlank();

punisherBlank();
// punisherOutline();

/* punisherOutline() -- test piece for outline
 */
module punisherOutline() {
   testHeight = 40; // should be more than blankHeight, below.

   translate([0,0,testHeight]) rotate([180,0,0]) {
      blankCutout(height=testHeight - 0.1, outlineScale=1.2) punisherBlank();
   }
}

module punisherBlank(centerCutout=1) {
   blankHeight = 30; 
   
   /* rotate, etc. positions blank upside-down on XY plane */
   rotate([180,0,0]) translate([0,0,-binHeight]) union() {
      difference() {
         translate([0,0,binHeight- (blankHeight)])
            linear_extrude(height=blankHeight) punisherShell();
      }
      if (centerCutout) linear_extrude(height=binHeight) centerCutoutPoly();
   } /* rotate, translate, union */
}

/* punisherShell() -- outline */
module punisherShell() {
   for (i=[0:1]) mirror([0,i,0]) 
      polygon([[10,0],[10,-15.9],[18.6,-16.5],[24.3,-24.4],[24.3,-27],
               [-3,-27],[-3,-29], [-11.2,-29],[-11.2,-27],[-24.3,-27],
               [-24.3,-24.4],[-18.5,-16.5],[-17.5,-15.9], [-17.5,0]]);
}

/* centerCutoutPoly() -- defines a polygon to be cut all the way to the
 *                       bottom of the bin.
 */
module centerCutoutPoly() {
   hull() {
      translate([-15.5,-12,0]) circle(r=2);
      translate([8,12,0]) circle(r=2);
      translate([-15.5,12,0]) circle(r=2);
      translate([8,-12,0]) circle(r=2);
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

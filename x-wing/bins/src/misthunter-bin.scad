/* misthunter-bin.scad
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
locations = [[[0,4.5,0]]];

// harborFreightMediumFullHt(locations,inset=1) misthunterBlank();

// misthunterBlank(centerCutout=0);
misthunterOutline();

/* misthunterOutline() -- test piece for outline
 */
module misthunterOutline() {
   translate([0,0,40]) rotate([180,0,0]) {
      blankCutout(height=31 - 0.1, outlineScale=1.2) misthunterBlank();
   }
}

module misthunterBlank(centerCutout=1) {
   blankHeight = 36; 

   if (centerCutout) {
      rotate([180,0,0]) translate([0,0,-binHeight]) difference() {
         linear_extrude(height=binHeight) misthunterShell();
         translate([-7.5,26,0]) cube([15,8,8+binHeight-blankHeight]);
         translate([16.5,-33.1,0]) cube([6,34,27+binHeight-blankHeight]);
         translate([-16.5-6,-33.1,0]) cube([6,34,27+binHeight-blankHeight]);
      }
   }
   else {
      rotate([180,0,0]) translate([0,0,-blankHeight]) difference() {
         linear_extrude(height=blankHeight) misthunterShell();
         translate([-7.5,26,0]) cube([15,8,8]);
         translate([16.5,-33.1,0]) cube([6,34,27]);
         translate([-16.5-6,-33.1,0]) cube([6,34,27]);
      }
   }
}

/* misthunterShell() -- outline, adapted from some other model */
module misthunterShell() {
   for (i=[0:1]) mirror([i,0,0]) 
      translate([0,-33,0]) 
      polygon(points=[[-0.1,0],[21.5,0],[21.5,32],[7,34],[5.5,66],[-0.1,66]]);
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

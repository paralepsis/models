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
blankHeight = 21; 
angle=0;

/* locations is a pair of triples, translate : rotate pairs
 */
locations = [[[-28.5,-31,0], [0,0,127]],
             [[28.5,31,0], [0,0,-53]]];

harborFreightLargeHalfHt(locations,inset=0.5) arcBlank();

// arcBlank();
// arcOutline();

/* arcOutline() -- test piece for outline
 */
module arcOutline() {
   translate([0,0,binHeight]) rotate([180,0,0]) {
      blankCutout(height=binHeight, outlineScale=1.2) arcBlank();
   }
}

/* NOTE: Something is amiss with the bits being removed, in terms of
 *       height, but I'm not going to bother to try to figure it out.
 */
module arcBlank() {
   /* rotate, etc. positions blank upside-down on XY plane */
   rotate([180,0,0]) translate([0,0,-binHeight]) union() {
      difference() {
         translate([0,0,binHeight-blankHeight])
            linear_extrude(height=blankHeight) arcShell();
         if (1) translate([0,0,-0.1]) {
            /* bits to remove to support ship */
            arcSideSupports();
            arcCenterSupports();
         }
      }
   } /* rotate, translate, union */
}

/* arcShell() -- exterior outline */
module arcShell() {
   for (j=[0:1]) mirror([j,0,0])
      polygon(points=[
                     [-0.1,-1.5], [2,-1.5], [2.5,0],[5,0], [6,5], [10,6],
                     [13,12], [37,21], [44,22], [44,29], [42,31], [41,50],
                     [37,50], [37,31], [14,31], [13,34], [5,34], [1.5,54],
                     [-0.1,54]
                     ]);
}

module arcSideSupports() {
   linear_extrude(height=7.5+0.1) for (j=[0:1]) mirror([j,0,0])
      polygon(points=[[37,21], [44,22], [44,29], [42,31], [41,50], [37,50],
                      [37,31]]);
}

module arcCenterSupports() {
   linear_extrude(height=10+0.1)
      polygon(points=[[13,44], [2,54], [-2,54], [-13,44]]);
   linear_extrude(height=8+0.1)
      polygon(points=[[13,-2],[13,17],[10,22],[-10,22],[-13,17],[-13,-2]]);
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

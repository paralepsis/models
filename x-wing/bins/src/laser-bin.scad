/* laser-bin.scad
 *
 * Copyright (C) Robert B. Ross, 2017
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
locations = [[[26.5,-40,0], [0,0,90]]];

harborFreightLargeHalfHt(locations,inset=0.5,filled=0,cornerRad=3.75,
                          bottomThick=0.9) laserBlank();

// laserBlank();
// laserOutline();

/* laserOutline() -- test piece for outline
 */
module laserOutline() {
   translate([0,0,18-0.1]) rotate([180,0,0]) {
      blankCutout(height=18 - 0.1, outlineScale=1.2) laserBlank();
   }
}

module laserBlank() {
   blankHeight = 14.0;
   
   /* Note: position blank upside-down on XY plane */
   union() {
      translate([0,0,0]) intersection() {
         linear_extrude(height=blankHeight) laserShell();
      }
   } /* rotate, translate, union */
}

/* laserShell() -- exterior outline */
module laserShell() {
   square([80,20]);
   translate([80,5]) square([10,8]);
   translate([55,0]) square([15,30]);
   translate([63,30]) circle(r=8);
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

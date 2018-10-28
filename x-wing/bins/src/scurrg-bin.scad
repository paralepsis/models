/* scurrg-bin.scad
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
locations = [[[26.5,-31,0], [0,0,53]]];

if (0) harborFreightLargeHalfHt(locations,inset=0.5,filled=1,cornerRad=3.75,
                          bottomThick=0.9) scurrgBlank();
if (1) scurrgBlank();

if (0) {
translate([-50,0,0]) harborFreightLargeHalfHt(locations,inset=0.5,filled=1,cornerRad=3.75,
                          bottomThick=0.9) scurrgBlank();
translate([50,0,0]) harborFreightLargeHalfHt(locations,inset=0.5,filled=0,cornerRad=3.75,
                          bottomThick=0.9) scurrgBlank();

translate([0,-120,0]) scurrgBlank();
}

// scurrgOutline();

/* scurrgOutline() -- test piece for outline
 */
module scurrgOutline() {
   translate([0,0,18-0.1]) rotate([180,0,0]) {
      blankCutout(height=18 - 0.1, outlineScale=1.2) scurrgBlank();
   }
}

module scurrgBlank(centerCutout=1, useProfile=1) {
   blankHeight = 14.0;
   
   /* Note: position blank upside-down on XY plane */
   union() {
      translate([0,0,0]) intersection() {
         linear_extrude(height=blankHeight) scurrgShell();
         if (useProfile) scurrgProfile(h=blankHeight);
      }
      if (centerCutout) linear_extrude(height=binHeight) scurrgCutoutPoly();
   } /* rotate, translate, union */
}

/* scurrgShell() -- exterior outline */
module scurrgShell() {
   for (j=[0:1]) mirror([j,0,0])
      polygon(points=[
                     [-0.1,1], [8,1], [12,4.5], [24,14], [30,15], [34,15], 
                     [35,13], [37,13], [38,15], [39.0,16], [39.0,40], 
                     [37,42], [37,53], [33.5,53], [33.5,49], [32,49],
                     [31,41], [14,49], [11,50.5], [8,50], [-0.1,50]
                     ]);
}

/* scurrgProfile() - defines the side profile of the blank (not cutout)
 */
module scurrgProfile(h=100,w=200)
{
   translate([-1*w/2,0,0]) rotate([90,0,90]) linear_extrude(height=w) {
      polygon(points=[
                     [-1,0], [55,0], [55,17], [-1,7]
                     ]);
   }

}

/* scurrgCutoutPoly() -- defines a polygon to be cut all the way to the
 *                     bottom of the bin.
 *
 */
module scurrgCutoutPoly() {
   for (j=[0:1]) mirror([j,0,0])
      polygon(points=[
                     [-0.1,1], [8,1], [12,4.5], [16,5.5], [16,48], [14,49],
                     [11,50.5], [8,50], [-0.1,50]
                     ]);
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

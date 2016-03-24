/* yt-2400-bin.scad
 *
 * Copyright (C) Robert B. Ross, 2016
 *
 * This software is released under the Creative Commons
 * Attribution-ShareAlike 4.0 International Public License.
 */


include <./bintools.scad>

$fn=160;

/* locations is a pair of triples, translate : rotate pairs
 */
locations = [[[3,-14,0], [0,0,0]]];

harborFreightLargeFullHt(locations,inset=0.5) intersection() {
   translate([-3,14,0]) roundBoxBottom(cornerRad=3.75,xDim=80-1.6*2,
                                       yDim=109.25-1.6*2,ht=46.5);
   yt2400Blank();
}

// yt2400Blank();
// yt2400Outline();

/*
difference() {
   yt2400Outline();
   translate([2.5,-30,0]) cube([40,60,50]);
}
*/

/* yt2400Outline() -- test piece for outline
 */
module yt2400Outline() {
   translate([0,0,33]) rotate([180,0,0]) {
      blankCutout(height=34.5 - 0.1, outlineScale=1.2) yt2400Blank();
   }
}

module yt2400Blank() {
   blankHeight = 34; /* was 32 */
   
   rotate([180,0,0]) translate([0,0,-blankHeight]) union() {
      yt2400Body();
      translate([0,0,20]) linear_extrude(height=blankHeight-20) 
         projection(cut=true) translate([0,0,-20]) yt2400Body();
   } /* rotate, translate, union */
}

/* yt2400Body()
 *
 * Notes:
 * - overall height is 32, but have to push to full 46.5 (+) 
 * - depth of main section should be more like 22-23mm
 */
module yt2400Body() {
   /* main body */
   translate([0,0,12]) cylinder(r=35,h=15);
   translate([-35,-38/2,10]) cube([20,38,17]); /* engine */
   rotate([0,0,-73]) translate([-39,-11,9]) cube([18,22,20]);

   /* cockpit, etc. */
   translate([-35+10,-59,20]) rotate([0,90,0]) cylinder(r=8,h=52);

   translate([0,0,12]) linear_extrude(height=15)
      polygon([[-17,-3], [35,-3], [19,-56], [-17,-56]]);

   /* cutouts */
   translate([0,0,-48.5+32]) cylinder(r=25,h=48.5); /* interior */
   translate([0,0,-48.5+32]) linear_extrude(height=48.5)
      polygon([[-17+10,-3], [35-10,-3], [19-10,-56], [-17+10,-56]]);
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

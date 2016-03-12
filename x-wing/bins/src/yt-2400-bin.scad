/* yt-2400-bin.scad
 *
 * Copyright (C) Robert B. Ross, 2016
 *
 * This software is released under the Creative Commons
 * Attribution-ShareAlike 4.0 International Public License.
 */


include <./bintools.scad>

$fn=160;

// % translate([0,0,-5]) import("/Users/rross/Downloads/1_BWing_Medium.STL");

/* locations is a pair of triples, translate : rotate pairs
 */
locations = [[[0,-5.75,0], [0,0,0]]];


// yt2400Blank();
yt2400Outline();

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
   blankHeight = 32;
   
   rotate([180,0,0]) translate([0,0,-blankHeight]) union() {
      yt2400Body();
      translate([0,0,20]) linear_extrude(height=blankHeight-20) 
         projection(cut=true) translate([0,0,-20]) yt2400Body();
   } /* rotate, translate, union */
}

/* yt2400Body()
 *
 * Notes:
 */
module yt2400Body() {
   /* main body */
   translate([0,0,12]) cylinder(r=35,h=15);
   translate([0,0,3]) cylinder(r=17,h=9.1);
   translate([8,0,7]) cube(center=true,[30,7,14]); /* gun */
   translate([-35,-38/2,12]) cube([10,38,15]); /* engine */

   rotate([0,0,-75]) translate([-40,-11,9]) cube([15,22,20]);

   translate([-35+10,-58,20]) rotate([0,90,0]) cylinder(r=8,h=52);
   translate([0,0,12]) linear_extrude(height=15)
      polygon([[-15,-3], [35,-3], [19,-55], [-15,-55]]);
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

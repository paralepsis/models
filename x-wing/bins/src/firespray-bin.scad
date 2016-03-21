/* firespray-bin.scad
 *
 * Copyright (C) Robert B. Ross, 2016
 *
 * XWTMG Firespray Stanley Insert by GMBridge (Graham Bridge) is
 * licensed under the Creative Commons - Attribution - Share Alike
 * license.
 *
 * Downloarde from http://www.thingiverse.com/thing:1282316 on 3/21/2016.
 */

include <./bintools.scad>

// color ("red") translate([7,-1,-10]) rotate([0,0,32]) import("../orig/firespray-box.stl");


binHeight = 46.5;
blankHeight = 34; /* doesn't include anything that is cut to the base */
$fn=160;

/* locations is a pair of triples, translate : rotate pairs
 */
locations = [[[-4.5,-15,0], [0,0,32]]];

// harborFreightLargeFullHt(locations,inset=0.5) firesprayBlank();

// firesprayBlank();
firesprayOutline();

/*
difference() {
   firesprayOutline();
   translate([2.5,-30,0]) cube([40,60,50]);
}
*/

/* firesprayOutline() -- test piece for outline
 */
module firesprayOutline() {
   translate([0,0,blankHeight+2]) rotate([180,0,0]) {
      blankCutout(height=blankHeight+2 - 0.1, outlineScale=1.2) firesprayBlank();
   }
}

module firesprayBlank() {
   
   // rotate([180,0,0]) translate([0,0,-binHeight]) union() {
      scale([1,1.5,1]) cylinder(h=30,r=23);
      scale([1,1.5,1]) cylinder(h=binHeight,r=18);
      translate([0,-9,15]) cube(center=true,size=[82,12,30]);
      translate([0,32,15]) cube(center=true,size=[20,30,30]);
   // } /* rotate, translate, union */
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

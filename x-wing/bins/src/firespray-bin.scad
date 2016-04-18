/* firespray-bin.scad
 *
 * Copyright (C) Robert B. Ross, 2016
 *
 * XWTMG Firespray Stanley Insert by GMBridge (Graham Bridge) is
 * licensed under the Creative Commons - Attribution - Share Alike
 * license.
 *
 * Downloaded from http://www.thingiverse.com/thing:1282316 on 3/21/2016.
 */

include <./bintools.scad>
use <tie-advanced-bin.scad>

// color ("red") translate([7,-1,-10]) rotate([0,0,32]) import("../orig/firespray-box.stl");

// blankHeight was 34

binHeight = 46.5;
blankHeight = 38; /* doesn't include anything that is cut to the base */
$fn=160;

/* locations is a pair of triples, translate : rotate pairs
 */
locations = [[[-6.5,-15,0], [0,0,32]]];

// harborFreightLargeFullHt(locations,inset=0.5) firesprayBlank();

intersection() 
{ 
   union() {
      harborFreightLargeFullHt(locations,inset=0.5) angledFiresprayBlank();
      if (1) {
         translate([19.75,-35.75,0]) rotate([0,0,-90]) difference() {
            blankOutline(height=46.5-0.1) advancedBlank();
            translate([0,0,46.5]) mirror([0,0,1]) advancedBlank();
         }
      }
   }

   /* make sure it all fits in the bin volume */
   hull() harborFreightLargeFullHt([],inset=0.5);
}

// angledFiresprayBlank();
// firesprayBlank();
// firesprayOutline();

module angledFiresprayBlank() {
   translate([0,50,0]) rotate([6.5,0,0]) translate([0,-50,0])
      firesprayBlank(cutout=0);
   translate([0,-5,0]) scale([1,1.54,1]) cylinder(h=binHeight,r=18);
}

module firesprayBlank(cutout=1) {
   
   // rotate([180,0,0]) translate([0,0,-binHeight]) union() {
      scale([1,1.54,1]) cylinder(h=36,r=23);
      if (cutout) scale([1,1.54,1]) cylinder(h=binHeight,r=18);
      translate([0,-9,39/2]) cube(center=true,size=[82,12,39]);
      translate([0,34,36/2]) cube(center=true,size=[20,32,36]); // was 33
   // } /* rotate, translate, union */
}

/* firesprayOutline() -- test piece for outline
 */
module firesprayOutline() {
   translate([0,0,binHeight]) rotate([180,0,0]) {
      blankCutout(height=binHeight - 0.1, outlineScale=1.2)
         angledFiresprayBlank();
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

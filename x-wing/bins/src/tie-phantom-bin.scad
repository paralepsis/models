/* tie-phantom-bin.scad
 *
 * Copyright (C) Robert B. Ross, 2016
 *
 * This software is released under the Creative Commons
 * Attribution-ShareAlike 4.0 International Public License.
 */

include <./bintools.scad>

$fn=160;
binHeight   = 46.5;
angle=0;

/* locations is a pair of triples, translate : rotate pairs
 */
locations = [[[0,0,0], [0,0,0]]];

// harborFreightMediumFullHt(locations,inset=1) phantomBlank();

// phantomBlank();
phantomOutline();

/* phantomOutline() -- test piece for outline
 */
module phantomOutline() {
   translate([0,0,40]) rotate([180,0,0]) {
      blankCutout(height=20 - 0.1, outlineScale=1.2) phantomBlank();
   }

}

module phantomBlank(centerCutout=1) {
   blankHeight = 39.5; 
   
   /* rotate, etc. positions blank upside-down on XY plane */
   rotate([180,0,0]) translate([0,0,-binHeight]) union() {
      difference() {
         translate([0,0,binHeight-blankHeight])
            linear_extrude(height=blankHeight) phantomShell();
      }
   } /* rotate, translate, union */
}

/* phantomShell() -- outline, adapted from some other model */
module phantomShell() {
   rotate([0,0,180]) translate([0,-2.5,0]) square([7,5]);
   rotate([0,0,60]) translate([0,-2.5,0]) square([7,5]);
   rotate([0,0,-60]) translate([0,-2.5,0]) square([7,5]);
   rotate([0,0,180]) translate([0,-1.25,0]) square([17,2.5]);
   rotate([0,0,60]) translate([0,-1.25,0]) square([17,2.5]);
   rotate([0,0,-60]) translate([0,-1.25,0]) square([17,2.5]);
   rotate([0,0,0]) translate([0,-2.5,0]) square([14,5]);
   difference() {
      circle($fn=3,r=12);
      translate([8,-2.5,0]) square([5,5]);
      rotate([0,0,120]) translate([8,-2.5,0]) square([5,5]);
      rotate([0,0,-120]) translate([8,-2.5,0]) square([5,5]);
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

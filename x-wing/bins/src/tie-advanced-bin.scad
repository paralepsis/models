/* tie-advanced-bin.scad
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
locations = [[[0,-17.75,0], [0,0,0]],
              [[0,17.75,0],[0,0,0]]];
binHeight   = 46.5/2;

// harborFreightMediumHalfHt(locations,inset=0.0) advancedBlank();

harborFreightSmallFullHt([[0,0,0],[0,0,0]],inset=0.0) advancedBlank();

// advancedBlank();
// advancedOutline();

/* advancedOutline() -- test piece for outline
 */
module advancedOutline() {
   translate([0,0,23.5]) rotate([180,0,0]) {
      // blankCutout(height=binHeight - 0.1, outlineScale=1.2) advancedBlank();
      blankCutout(height=23.5 - 0.1, outlineScale=1.2) advancedBlank();
   }
}

module advancedBlank() {
   advancedHeight = 23.5; // total height of the advanced

   rotate([180,0,0]) translate([0,0,-1*advancedHeight]) union() {
      difference() { 
         translate([0,35/2,0]) rotate([90,0,0]) linear_extrude(height=35)
            for(i=[0:1]) mirror([i,0,0]) polygon(points=[[0,0],[0,0],[0,3],
                                                 [10,3],[16,10],
                                                 [16,advancedHeight],
                                                 [0,advancedHeight]]);

         translate([-16.0,-0.01,-0.01]) rotate([-90,0,-90]) linear_extrude(height=32)
            polygon(points=[[17.5,-10],[17.5,-3],[13.5,-3]]);
         translate([16.0,0.01,-0.01]) rotate([-90,0,90]) linear_extrude(height=32)
            polygon(points=[[17.5,-10],[17.5,-3],[13.5,-3]]);
      }
      translate([0,22-16.5,0]) cylinder(r=5/2,h=3.1);
   } /* rotate and translate */
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

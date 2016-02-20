/* ig-88-bin.scad
 *
 * Copyright (C) Robert B. Ross, 2016
 *
 * This software is released under the Creative Commons
 * Attribution-ShareAlike 4.0 International Public License.
 */

include <./bintools.scad>

$fn=30;

// ig88Outline();
// ig88Blank();
betterIg88Bin();


module basicIg88Bin() {
   harborFreightLargeHalfHt(locations=[[[0,0,0],[0,0,0]]]) ig88Blank();
}

module betterIg88Bin() {
   harborFreightLargeHalfHt(locations=[[[0,17.75,0],[0,0,180]]]) ig88Blank();
   translate([-40,23.75,0]) cube([80,2,46.5/2]);
}


module ig88Outline() {
   translate([0,0,46.5/2]) rotate([180,0,0]) 
      blankCutout(height=46.5/2 - 0.1, outlineScale=1.2) ig88Blank();
}

module ig88Blank() {
   rotate([0,0,0]) {
      /* peg hole */
      cylinder(h=18,r=3.6);

      difference() {
         union() {
            linear_extrude(height=13.25) {
               polygon(points=[[0,19],[4,19],[7,41],[14,41],[14,15],
                               [26,15],[31,-21],[19,-35],[13,-35], // [17,-37]
                               [22,-23],[19,0],[12,-5],[5,-30],[0,-30]]);
               mirror([1,0,0]) polygon(points=[[0,19],[4,19],[7,41],[14,41],[14,15],
                               [26,15],[31,-21],[19,-35],[13,-35],
                               [22,-23],[19,0],[12,-5],[5,-30],[0,-30]]);
            }
         }
         
         /* differenced out */
         translate([-19,-40,13]) rotate([-3,0,0]) cube([38,90,10]);
      }
   }
}

/*
 * Local variables:
 *  mode: C
 *  c-indent-level: 4
 *  c-basic-offset: 4
 * End:
 *
 * vim: ts=8 sts=4 sw=4 expandtab
 */

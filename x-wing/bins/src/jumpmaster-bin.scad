/* jumpmaster-bin.scad
 *
 * Copyright (C) Robert B. Ross, 2016
 *
 * This software is released under the Creative Commons
 * Attribution-ShareAlike 4.0 International Public License.
 */


include <./bintools.scad>

$fn=160;
binHeight=46.5/2;

/* locations is a pair of triples, translate : rotate pairs
 */
locations = [[[-5,-12.5,0], [0,0,2]]];

if (0) {
   intersection() {
      hull() harborFreightLargeHalfHt();
      harborFreightLargeHalfHt(locations,inset=0.5) intersection() {
         jumpmasterBlank();
      }
   }
}
else {
   jumpmasterBlank();
}

/* jumpmasterOutline() -- test piece for outline
 */
module jumpmasterOutline() {
   translate([0,0,10]) rotate([180,0,0]) {
      blankCutout(height=20, outlineScale=1.2) jumpmasterBlank();
   }
}

module jumpmasterBlank() {
   blankHeight = binHeight; /* was 32 */
   
   rotate([180,0,0]) translate([0,0,-blankHeight]) union() {
      jumpmasterBody();
   } /* rotate, translate, union */
}

/* jumpmasterBody()
 *
 * Notes:
 */
module jumpmasterBody() {
   difference() {
      union() {
         /* main body */
         translate([0,0,binHeight-17.5]) cylinder(r=80.5/2,h=17.5);

         /* cockpit, etc. */
         translate([29,-20,binHeight-17.5]) {
            linear_extrude(height=17.5)
               polygon(points=[[0,0], [15,5], [15,10], [0,15]]);
         }
         /* cutouts */
         translate([0,0,0]) cylinder(r=79/2-7,h=binHeight); /* interior */
         }

      /* difference out */
      translate([-60,-3,-0.5]) cube([64,16,binHeight+1]);
      translate([-54,-35,-0.5]) cube([20,70,binHeight+1]);
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

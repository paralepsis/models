/* starviper-bin.scad
 *
 * Copyright (C) Robert B. Ross, 2016
 *
 * This software is released under the Creative Commons Attribution
 * License. It is derived from the model by ThisIsDavin
 * as downloaded on 4/29/2016 from the following URL:
 *   http://www.thingiverse.com/thing:1515669
 *
 * Specifically, the outline of the Starviper was extracted from 
 * ThisIsDavin's model.
 */

include <./bintools.scad>

$fn=160;
binHeight   = 46.5;
angle=0;

/* locations is a pair of triples, translate : rotate pairs
 */
locations = [[[0,0.75,0], [0,0,90]],
             [[0,52,0], [0,0,90]],
             [[0,52-25.5,0], [0,0,90]],
             [[0,25.25-50.5,0], [0,0,90]]
            ];

// harborFreightMediumFullHt(locations,inset=1) starviperBlank();
difference() {
   harborFreightLargeFullHt(locations,inset=1) starviperBlank();
   translate([-7.5,-50,15]) cube([15,102,60]);
}

// starviperBlank();
// starviperOutline();

/* starviperOutline() -- test piece for outline
 */
module starviperOutline() {
   translate([0,0,40]) rotate([180,0,0]) {
      blankCutout() starviperBlank();
   }
}

module starviperBlank(centerCutout=1) {
   blankHeight = 22*2; 
   
   /* rotate, etc. positions blank upside-down on XY plane */
   translate([0,0,blankHeight/2])
   rotate([0,-90,0]) union() {
      difference() {
         translate([0,0,0])
            linear_extrude(height=24) starviperShell();
      }
   } /* rotate, translate, union */
}

/* starviperShell() -- outline, adapted from some other model */
module starviperShell() {
   union() {
      for (i=[0:1]) mirror([0,i/2,0]) 
         polygon(points=[[-0.1,-0.1], [9.5,-0.1], [9.5,5.16], [14.64,6.23],
                         [14.64,13],[19.85,12.1],[22,17.05], [19.7,23.41],
                         [19.6,33.5], [19.6,37], [-0.1,37]]);
      translate([-22,-37]) square(center=false,[22,37*2]);
   }
}

/* centerCutoutPoly() -- defines a polygon to be cut all the way to the
 *                       bottom of the bin.
 *
 */
module centerCutoutPoly() {
   for (j=[0:1]) mirror([j,0,0])
   for (i=[0:1]) mirror([0,i/2,0]) 
      polygon(points=[[-0.1,-0.1], [9.5,-0.1], [9.5,5.16], [14.64,6.23],
                      [14.64,13],[19.85,12.1],[22,17.05],// [19.7,23.41],
                      // [19.6,33.5], [19.6,37], [14.95,37], [14.95,33.5],
                      // [11.07,22.93],
                     [9.9,22.93], [9.5,25],[-0.1,25]]);
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

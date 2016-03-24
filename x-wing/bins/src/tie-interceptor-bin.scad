/* tie-interceptor-bin.scad
 *
 * Copyright (C) Robert B. Ross, 2016
 *
 * This software is released under the Creative Commons
 * Attribution-ShareAlike 4.0 International Public License.
 */


include <./bintools.scad>

$fn=160;

binHeight   = 46.5;
interceptorHeight = 26; // total height of the interceptor

/* locations is a pair of triples, translate : rotate pairs
 */
locations = [[[1.75,-5.5,0], [0,0,0]],
              [[-1.75,5.5,0],[0,0,180]]];

// harborFreightMediumFullHt(locations,inset=0.5) interceptorBlank();
harborFreightSmallFullHt(locations,inset=0.0) interceptorBlank();

// interceptorBlank();

/* interceptorOutline() -- test piece for outline
 */
module interceptorOutline() {
   translate([0,0,23.5]) rotate([180,0,0]) {
      // blankCutout(height=binHeight - 0.1, outlineScale=1.2) interceptorBlank();
      blankCutout(height=23.5 - 0.1, outlineScale=1.2) interceptorBlank();
   }
}

/* interceptorBlank()
 *
 * Notes:
 * - derived from advanced blank
 * - kind of a nonsense approach; sorry about that.
 * - fits, though :).
 */
module interceptorBlank() {
   intersection() { 
      union() {
         linear_extrude(height=interceptorHeight+1) for(i=[0:1]) mirror([i,0,0])
            polygon(points=[[15.5,-39/2],[15.5,39/2],
                            [11.0,39/2],[8,-6],[0,-6],
                            [0,-39/2]]);
         translate([0,-38/2+9,0]) cylinder(r=7.5,h=interceptorHeight+1);
      }

      rotate([180,0,0]) translate([0,0,-1*interceptorHeight]) union() {
         difference() { 
            translate([0,38/2,0]) rotate([90,0,0]) linear_extrude(height=38)
               for(i=[0:1]) mirror([i,0,0]) polygon(points=[[0,0],[0,0],[0,2],
                                                    [10,2],[15.5,10],
                                                    [15.5,interceptorHeight],
                                                    [0,interceptorHeight]]);

            /* back angle cutout */
            translate([16.0,0.01,-1.01]) rotate([-90,0,90])
               linear_extrude(height=32)
               polygon(points=[[38/2,-10],[38/2,-3],[38/2-4,-3]]);

            /* front angle cutout */
            translate([16,38/2,2]) rotate([90,0,-90]) linear_extrude(height=32)
               polygon(points=[[0,0], [10,0], [34,6], [39,6], [39,-4], [0,-4]]);
         }

         /* post hole */
         translate([0,38/2-9,0]) cylinder(r=5/2,h=3.1);
   
      } /* rotate and translate */
   } /* intersection */
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

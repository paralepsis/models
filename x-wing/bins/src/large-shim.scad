/* large-filler-bin.scad
 *
 * Copyright (C) Robert B. Ross, 2016
 *
 * This software is released under the Creative Commons
 * Attribution-ShareAlike 4.0 International Public License.
 */

include <./bintools.scad>

/*
 * See above for description of locations variable
 *
 * Dimensions (from Kariko83)
 *   46.5mm tall
 *   48.6mm tall with legs
 *   109.25mm wide
 *   80mm length
 */

rad=7;

difference() {
   roundBoxBottom(xDim=76,yDim=106,ht=3);

   hull() {
      translate([76/2,2,-0.05]) cylinder(r=rad,h=3.1);
      translate([76/2,-2,0.05]) cylinder(r=rad,h=3.1);
   }
   hull() {
      translate([-76/2,2,-0.05]) cylinder(r=rad,h=3.1);
      translate([-76/2,-2,-0.05]) cylinder(r=rad,h=3.1);
   }

   /* corners */
   translate([-76/2,-106/2,-0.05]) cylinder(r=rad,h=3.1);
   translate([76/2,-106/2,-0.05]) cylinder(r=rad,h=3.1);
   translate([-76/2,106/2,-0.05]) cylinder(r=rad,h=3.1);
   translate([76/2,106/2,-0.05]) cylinder(r=rad,h=3.1);

   hull() {
      translate([-1,-106/2,-0.05]) cylinder(r=rad,h=3.1);
      translate([1,-106/2,-0.05]) cylinder(r=rad,h=3.1);
   }
   hull() {
      translate([-1,106/2,-0.05]) cylinder(r=rad,h=3.1);
      translate([1,106/2,-0.05]) cylinder(r=rad,h=3.1);
   }

   /* big cut-outs */
   difference() {
      union() {
         hull() {
            translate([20,-34,-0.05]) cylinder(r=rad,h=3.1);
            translate([20,-14,-0.05]) cylinder(r=rad,h=3.1);
            translate([-20,-34,-0.05]) cylinder(r=rad,h=3.1);
            translate([-20,-14,-0.05]) cylinder(r=rad,h=3.1);
         }
      
         hull() {
            translate([20,34,-0.05]) cylinder(r=rad,h=3.1);
            translate([20,14,-0.05]) cylinder(r=rad,h=3.1);
            translate([-20,34,-0.05]) cylinder(r=rad,h=3.1);
            translate([-20,14,-0.05]) cylinder(r=rad,h=3.1);
         }
      }
      translate([0,0,-0.1]) cylinder(r=3*rad,h=3.2);
   }
   translate([0,0,-0.05]) cylinder(r=rad*1.6,h=3.1);
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

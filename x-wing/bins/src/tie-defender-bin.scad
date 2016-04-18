/* tie-defender-bin.scad
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
locations = [[[2,-18.25,0], [0,0,60]],
              [[-2,18.25,0],[0,0,0]]];
binHeight   = 46.5;

harborFreightMediumFullHt(locations,inset=0.5) defenderBlank();

// defenderBlank();
// defenderOutline();

/* defenderOutline() -- test piece for outline
 */
module defenderOutline() {
   translate([0,0,binHeight]) rotate([180,0,0]) {
      blankCutout(height=binHeight - 0.1, outlineScale=1.2) defenderBlank();
   }
}

// 7, 14, 17


module defenderBlank() {
   defenderHeight = 36; // total height of the defender

   rotate([180,0,0]) translate([0,0,-1*defenderHeight]) difference() {
      union() {
         /* basic hexagonal space to surround ship */
         cylinder($fn=6,r1=14.5,r2=23.0,h=5);
         translate([0,0,5-0.05]) cylinder($fn=6,r=23.0,h=defenderHeight-5+0.05);

         /* create additional empty space below the ship */
         translate([0,0,defenderHeight-binHeight])
            cylinder(r=10,h=binHeight-defenderHeight+0.1);
      }

      /* additional cutouts to help keep ship from rotating around */
      for (i=[0:2]) {
         rotate([0,0,120*i]) translate([0,-20,-0.5])
            linear_extrude(height=defenderHeight+1)
            polygon([[-17/2,0], [-14/2,7], [14/2,7], [17/2,0]]);
      }

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

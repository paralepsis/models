/* laser-bin.scad
 *
 * Copyright (C) Robert B. Ross, 2017
 *
 * This software is released under the Creative Commons
 * Attribution-ShareAlike 4.0 International Public License.
 */

include <./bintools.scad>

$fn=160;

/* locations is a pair of triples, translate : rotate pairs
 */
locations = [];

harbor();

module harbor() {
   intersection() {
      union() {
         harborFreightMediumFullHt(locations,inset=1, bottomThick=0.9, wallThick=1.6);
         translate([-52/2-0.25,0,0]) cube([52.,1.6,44]);
         translate([-52/2-0.25,0,0]) cube([11,39,44]);
         translate([-5,39,0]) rotate([0,-90,90]) linear_extrude(height=39) polygon(points=[[0,0],[0,11],[44,11], [44,9]]);
      }
   
      hull() harborFreightMediumFullHt(locations, inset=1);
   }
}

module stanley() {
   intersection() {
      union() {
         stanleyMediumFullHt(locations,bottomThick=0.9);
         translate([-52/2-0.25,0,0]) cube([52, 1.5, 38]);
         translate([-52/2-0.25,0,0]) cube([11,39,38]);
         translate([-5,39,0]) rotate([0,-90,90]) linear_extrude(height=39) polygon(points=[[0,0],[0,11],[38,11], [38,9]]);
      }
   
      hull() stanleyMediumFullHt(locations);
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

include <./polyround.scad>

% translate([10,60,2]) cube([135,185,47]);

$fn=20;
thick=3;

mountPoints = [[-8,32,3],[-8,205,3],[10,205,2],[10,245,2],[145,245,2],
               [145,60,2], [112,60,3],[112,49,3],[8,49,3],[8,32,3]];
cutoutPoints = [[20,20,5],[20,165,5],[115,165,5],[115,20,5]];

difference() {
   union() {
      linear_extrude(height=thick) polygon(polyRound(mountPoints,3));

      /* alignment tabs */
      translate([10-0.4*4,60,thick-0.1]) cube([0.4*4,15,2]);
      translate([10-0.4*4,60-0.4*4,thick-0.1]) cube([15+0.4*4,0.4*4,2]);
      translate([10-0.4*4,170,thick-0.1]) cube([0.4*4,15,2]);
      translate([80,60-0.4*4,thick-0.1]) cube([15,0.4*4,2]);
   }
   union() {
      /* bolt holes */
      hull() {
         translate([0,40,-1]) cylinder(d=6.4,h=5);
         translate([0,42,-1]) cylinder(d=6.4,h=5);
      }
      hull() {
         translate([0,195,-1]) cylinder(d=6.4,h=5);
         translate([0,197,-1]) cylinder(d=6.4,h=5);
      }
      hull() {
         translate([44,54,-1]) cylinder(d=3.4,h=5);
         translate([46,54,-1]) cylinder(d=3.4,h=5);
      }
      hull() {
         translate([104,54,-1]) cylinder(d=3.4,h=5);
         translate([106,54,-1]) cylinder(d=3.4,h=5);
      }
      
      /* bottom cutout under enclosure, save plastic / time */
      translate([10,60,-1]) linear_extrude(height=5)
         polygon(polyRound(cutoutPoints,3));
   }
}

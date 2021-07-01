include <./polyround.scad>

% translate([60,100,2]) cube([60,90,20]);

$fn=20;
thick=3;

mountPoints = [[-8,32,3],[-8,205,3],[10,205,2],[145,205,2],
               [145,80,2],[10,80,3],[10,32,3]];

cutoutPoints = [[0,40,5],[0,125,5],[35,125,5],[35,40,5]];

mirror([1,0,0]) difference() {
   union() {
      linear_extrude(height=thick) polygon(polyRound(mountPoints,3));

      /* alignment tabs */
      translate([50,40,0]) {
         translate([10-0.4*4,60,thick-0.1]) cube([0.4*4,15,2]);
         translate([10-0.4*4,60-0.4*4,thick-0.1]) cube([15+0.4*4,0.4*4,2]);
         translate([10-0.4*4,60+70,thick-0.1]) cube([0.4*4,15,2]);
         translate([50,60-0.4*4,thick-0.1]) cube([15,0.4*4,2]);
      }
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
      
      /* bottom cutout under enclosure, save plastic / time */
      if (1) translate([10,60,-1]) linear_extrude(height=5)
         polygon(polyRound(cutoutPoints,3));
   }
}

include <./polyround.scad>

% translate([00,000,2]) cube([60,90,20]);

$fn=40;
thick=3;

mountPoints = [[-5,-10,3],[-5,70,3],[-15,70,3],[-15,90,3],
               [60,90,1],[60,10,3],[75,10,3], [75,-10,3]];

cutoutPoints = [[15,15,5],[15,75,5],[45,75,5],[45,15,5]];

mirror([0,0,0]) difference() {
   union() {
      linear_extrude(height=thick) polygon(polyRound(mountPoints,3));

      /* alignment tabs */
      translate([-10,-60,0]) {
         translate([10-0.4*4,60,thick-0.1]) cube([0.4*4,15,2]);
         translate([10-0.4*4,60-0.4*4,thick-0.1]) cube([15+0.4*4,0.4*4,2]);
         translate([10-0.4*4,60+70,thick-0.1]) cube([0.4*4,15,2]);
         translate([50,60-0.4*4,thick-0.1]) cube([15,0.4*4,2]);
      }
      translate([-7,80,0]) cylinder(d=11,h=6.5);
      translate([67,0,0]) cylinder(d=11,h=6.5);
   }
   translate([0,0,-1]) linear_extrude(height=5)
      polygon(polyRound(cutoutPoints,3));

   translate([-7,80,-1]) cylinder(d=4.75,h=5);
   translate([67,0,-1]) cylinder(d=4.75,h=5);
   translate([-7,80,2]) cylinder(d1=6,d2=6.2,h=5);
   translate([67,0,2]) cylinder(d1=6,d2=6.2,h=5);
}

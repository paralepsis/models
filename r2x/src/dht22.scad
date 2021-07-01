include <./polyround.scad>

// little screw is M2.5

$fn=30;


semiEnclose();

module semiEnclose() {
   outline = [[-1.2,-1,2], [-1.2,37+1.2,2], [18.2+10,37+1.2,2], [18.2+10,-1,2]];

   difference() {
      union() {
         difference() {
            linear_extrude(height=9) polygon(polyRound(outline,7));
            translate([0,0,2]) linear_extrude(height=10) polygon(points=[[0,-2],[0,33],[2,37],[15,37],[17,33],[17,-2]]);
         }
         
         translate([17/2,7,0]) cylinder(d=4,h=3);
      }
      translate([17/2,7,-0.1]) cylinder(d=2.4,h=3+0.2);
      translate([10,19,5]) rotate([0,90,0]) cylinder(d=2.9,h=100);
   }
}



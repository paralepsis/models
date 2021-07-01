include <./polyround.scad>

$fn=20;
thick=1.7;

bottomPoints = [[0,-15,0.1],[0,115,0.1],[39,115,3],[39,85,3],
                [29,75,3],[29,25,3],[39,15,3],[39,-15,3]];
frontPoints = [[0,-15,0.1],[0,115,0.1],[64,115,3],[64,-15,3]];
cutoutPoints = [[-1,-13,0.1],[-1,113,0.1],[62,113,3],[62,-13,3]];

difference() {
   union() {
      linear_extrude(height=thick) polygon(polyRound(bottomPoints,3));
      translate([10,0,0]) rotate([0,-90,0]) linear_extrude(height=10) polygon(polyRound(frontPoints,3));
   }
   union() {
      /* bolt holes */
      hull() {
         translate([32,-0.5,-1]) cylinder(d=3.6,h=5);
         translate([32,0.5,-1]) cylinder(d=3.6,h=5);
      }
      hull() {
         translate([32,98.5,-1]) cylinder(d=3.6,h=5);
         translate([32,99.5,-1]) cylinder(d=3.6,h=5);
      }
      
      translate([8.7,0,0]) rotate([0,-90,0]) linear_extrude(height=8.8) polygon(polyRound(cutoutPoints,3));
   }
}

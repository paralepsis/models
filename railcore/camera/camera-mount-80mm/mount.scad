% import("./80mmFanGrid.stl");
include <./polyround.scad>

perimThick = 3;

exteriorPoints = [[40,40,3],[40,-40,3],[-40,-40,3],[-40,40,3]];
interiorPoints = [[40-perimThick,40-perimThick,20],
                  [40-perimThick,-(40-perimThick),20],
                  [-(40-perimThick),-(40-perimThick),20],
                  [-(40-perimThick),40-perimThick,20]];

difference() {
   linear_extrude(height=5) polygon(polyRound(exteriorPoints,5));
   translate([0,0,-0.1]) linear_extrude(height=5.2) polygon(polyRound(interiorPoints,20));
   for (i=[0:3]) rotate([0,0,45+90*i]) translate([50.5,0,-0.1]) cylinder(h=10,d=4.3,$fn=40);
}


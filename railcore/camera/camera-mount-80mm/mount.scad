% import("./80mmFanGrid.stl");
include <./polyround.scad>

perimThick = 5;
mountThick = 4;

exteriorPoints = [[40,40,3],[40,-40,3],[-40,-40,3],[-40,40,3]];
interiorPoints = [[40-perimThick,40-perimThick,20],
                  [40-perimThick,-(40-perimThick),20],
                  [-(40-perimThick),-(40-perimThick),20],
                  [-(40-perimThick),40-perimThick,20]];

difference() {
   linear_extrude(height=mountThick) polygon(polyRound(exteriorPoints,5));
   translate([0,0,-0.1]) linear_extrude(height=mountThick+.2) polygon(polyRound(interiorPoints,20));
   for (i=[0:3]) rotate([0,0,45+90*i]) translate([50.5,0,-0.1]) cylinder(h=mountThick+0.2,d=4.3,$fn=40);
}

translate([0,-40+perimThick,0]) rotate([90,0,0])
hull() {
   translate([0,30,0]) cylinder(h=perimThick,d=10,$fn=40);
   translate([-30,0,0]) cube([60,mountThick,perimThick]);
}

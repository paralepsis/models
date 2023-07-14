include <./polyround.scad>

topThick = 20;
mountThick = 4;

exteriorPoints = [[-5,0,1], [220,0,5], [220,-10,5], [23,-20,20], [23,-100,1], [-5,-100,1]];
cutoutPoints = [[23,-5,20],[230,-5,1],[230,-25,1],[23,-140,1]];

difference() {
   linear_extrude(height=topThick) polygon(polyRound(exteriorPoints,30));

   translate([0,0,5]) linear_extrude(height=topThick) polygon(polyRound(cutoutPoints,30));
   translate([20/2-1,10,20/2+5]) rotate([90,0,0]) cylinder(d=20,h=150,$fn=50);
   translate([9,-130,20/2+5]) cube([10,150,15]);

   translate([50,-10,10]) rotate([-90,0,0]) cylinder(d=3.2,h=20,$fn=30);
   translate([180,-10,10]) rotate([-90,0,0]) cylinder(d=3.2,h=20,$fn=30);

   translate([20/2-1,-20,20/2+5]) rotate([90,0,0]) difference() {
      cylinder(d=35,h=6,$fn=50);
      translate([0,0,-1]) cylinder(d=25,h=8,$fn=50);
   }

   translate([20/2-1,-75,20/2+5]) rotate([90,0,0]) difference() {
      cylinder(d=35,h=6,$fn=50);
      translate([0,0,-1]) cylinder(d=25,h=8,$fn=50);
   }
}


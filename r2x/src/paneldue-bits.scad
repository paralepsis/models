//import("./paneldue-v0.stl");


$fn=30;

translate([-5,15,0]) bigBoltSpot();
translate([212+5,15,0]) rotate([0,0,180]) bigBoltSpot();


difference() {
   translate([212.5-20-5,105.7,0]) cube([10,8,19.4]);
   translate([212.5-20,109.9,-2]) cylinder(d=2.9,h=15);
}

module bigBoltSpot() {
   difference() {
      union() {
         cylinder(d=10,h=3);
         translate([0,-5,0]) cube([20,10,3]);
      }
      translate([0,0,-1]) cylinder(d=6.2,h=5);
   }
}

$fn=30;

import("../r2x-alu-rhsfan-duct.stl");

translate([-30.6,-14.875,42]) difference() {
   union() {
      cube([4,10,7]);
      translate([0,5,7]) rotate([0,90,0]) cylinder(d=10,h=4);
   }

   translate([-2,5,7]) rotate([0,90,0]) cylinder(d=3.2,h=10);
   translate([-0.1,-0.5,-0.1]) cube([3.2,11,1.6]);
}

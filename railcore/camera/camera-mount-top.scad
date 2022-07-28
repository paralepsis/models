// width=35;
// height=35;

$fn=30;

// heat set M3 nut is 5mm diameter and 4mm thick/high

frameMount();

module frameMount(depth=4) {
   difference() {
      hull() {
         translate([2,10,0]) cylinder(r=2,h=depth);
         translate([2,-9,0]) cylinder(r=2,h=depth);
         translate([20,-9,0]) cylinder(r=2,h=depth);
         translate([20,10,0]) cylinder(r=2,h=depth);
      }
      hull() {
         translate([5,0,-1]) cylinder(d=3.3, h=depth+2);
         translate([5,-4,-1]) cylinder(d=3.3, h=depth+2);
      }
      hull() {
         translate([17,0,-1]) cylinder(d=3.3, h=depth+2);
         translate([17,-4,-1]) cylinder(d=3.3, h=depth+2);
      }
   }

   translate([11,12,5+depth-0.1]) rotate([90,0,0]) difference() {
      hull() {
         cylinder(d=10,h=4);
         translate([-5,-6,0]) cube([10,1,4]);
      }
      translate([0,0,-1]) cylinder(d=3.2,h=10);
   }
}

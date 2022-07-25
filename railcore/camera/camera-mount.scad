// width=35;
// height=35;

$fn=30;

// heat set M3 nut is 5mm diameter and 4mm thick/high

translate([-30,30,0]) frameMount();
cameraMount();

module cameraMount(depth=4) {
   translate([0,-1,0]) plate(width=41,height=8,depth=depth);
   translate([0,0,0]) plate(width=5,height=40,depth=depth);
   translate([36,0,0]) plate(width=5,height=40,depth=depth);

   translate([34.65,8.9,0])rotate([0,0,-90]) smallHole();
   translate([6.5,37.1,0]) rotate([0,0,90]) smallHole();
   translate([34.65,37.1,0])rotate([0,0,-90]) smallHole();

   translate([10,4,5+depth-0.1]) rotate([90,0,0]) difference() {
      hull() {
         cylinder(d=10,h=5);
         translate([-5,-6,0]) cube([10,1,5]);
      }
      translate([0,0,-1]) cylinder(d=4.9,h=10);
      translate([0,0,4.1]) cylinder(d1=4.9,d2=5.5,h=2);
   }
}

module smallHole() {
   difference() {
      union() {
         cylinder(h=4,r=3);
         translate([-3,0,0]) cube([6,3.1,4]);
      }
      translate([0,0,-0.05]) cylinder(h=4.1,r=1.3);
   }
}

/* plate() -- base of the mounting plate
 */
module plate(width=35,height=35,depth=4) {
   hull() {
      translate([2,2,0]) cylinder(r=2,h=depth);
      translate([width-2,2,0]) cylinder(r=2,h=depth);
      translate([2,height-2,0]) cylinder(r=2,h=depth);
      translate([width-2,height-2,0]) cylinder(r=2,h=depth);
   }
}

module frameMount(depth=4) {
   difference() {
      hull() {
         translate([2,10,0]) cylinder(r=2,h=depth);
         translate([2,-30,0]) cylinder(r=2,h=depth);
         translate([20,-30,0]) cylinder(r=2,h=depth);
         translate([20,10,0]) cylinder(r=2,h=depth);
      }
      hull() {
         translate([5,-3,-1]) cylinder(d=3.2, h=depth+2);
         translate([5,-25,-1]) cylinder(d=3.2, h=depth+2);
      }
      hull() {
         translate([17,-3,-1]) cylinder(d=3.2, h=depth+2);
         translate([17,-25,-1]) cylinder(d=3.2, h=depth+2);
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

// 1/4-20 (1/4" diameter, 20 threads per inch) socket for attachment to a tripod
// 1/4-20 nuts are commonly 7/16" from side to side (11.11mm)

// width=35;
// height=35;

$fn=30;

connector();
translate([0,-1,0]) plate(width=40,height=8);
translate([0,0,0]) plate(width=5,height=40);
translate([36,0,0]) plate(width=5,height=40);

// translate([6.5,8.9,0])rotate([0,0,90]) smallHole();
translate([34.65,8.9,0])rotate([0,0,-90]) smallHole();
translate([6.5,37.1,0]) rotate([0,0,90]) smallHole();
translate([34.65,37.1,0])rotate([0,0,-90]) smallHole();

module holeLocations() {
   /* locations of holes */
   translate([6.5,8.9,-0.1]) {
      translate([0,0,0]) color("green") cylinder(r=1.2,h=8);
      translate([28.2,0,0]) color("green") cylinder(r=1.2,h=8);
      translate([0,28.2,0]) color("green") cylinder(r=1.2,h=8);
      translate([28.2,28.2,0]) color("green") cylinder(r=1.2,h=8);
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


/* connector() -- to capture hex nut for mounting
 */
module connector() {
   difference() {
      union() {
         translate([41/2 - 6, -1, 3]) cube([12,8,5]);
         translate([41/2,7,8]) rotate([90,0,0]) cylinder(r=6,h=8);
      }
      union() {
         translate([41/2, 9,8]) rotate([90,0,0]) cylinder(r=6.35/2,h=13,$fn=30);
         translate([41/2,5,8]) rotate([90,0,0]) cylinder(r=12.4/2,h=4.14,$fn=6);
         translate([41/2-6,1-0.14,8]) cube([14,4.14,6]);
      }
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

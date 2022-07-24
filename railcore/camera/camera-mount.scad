// 1/4-20 (1/4" diameter, 20 threads per inch) socket for attachment to a tripod
// 1/4-20 nuts are commonly 7/16" from side to side (11.11mm)

// width=35;
// height=35;

$fn=30;

translate([0,-1,0]) plate(width=40,height=8);
translate([0,0,0]) plate(width=5,height=40);
translate([36,0,0]) plate(width=5,height=40);
mount();

translate([34.65,8.9,0])rotate([0,0,-90]) smallHole();
translate([6.5,37.1,0]) rotate([0,0,90]) smallHole();
translate([34.65,37.1,0])rotate([0,0,-90]) smallHole();

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

module mount(depth=4) {
   difference() {
      hull() {
         translate([2,2,0]) cylinder(r=2,h=depth);
         translate([2,-30,0]) cylinder(r=2,h=depth);
         translate([20,-30,0]) cylinder(r=2,h=depth);
         translate([20,2,0]) cylinder(r=2,h=depth);
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
}

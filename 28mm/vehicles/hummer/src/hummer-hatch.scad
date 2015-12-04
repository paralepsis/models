$fn=80;

translate([20,0,20]) rotate([180,0,-90]) scale([0.45,0.45,0.45]) import("../orig/KHERES_ASSAULT_CANNON.stl");

translate([-30,0,0]) import("/Users/rross/personal/3dprint/marine/marine-on-base.stl");

scale([0.6,0.6,0.6]) hatch();

module hatch() {
   /* main body */
   difference() {
      union() {
         cylinder(r=40/2, h=1.5);
         translate([0,0,1.49]) cylinder(r1=40/2, r2=37/2, h=2);
      }
      difference() {
         translate([0,0,1.5]) cylinder(r=35/2, h=2.5);   
         translate([0,0,1.4]) cylinder(r=34/2, h=2.7);   
      }
      translate([-34.05/2,-0.25,1.5]) cube([34.1,0.5,2.5]);
   }
   
   /* cubes on sides that attach hatch doors */
   translate([0,-18,2.5]) cube([8,6,5], center=true);
   translate([0,18,2.5]) cube([8,6,5], center=true);

   /* offshoot that mounts weapon */
   translate([22,0,0]) {
      difference() {
         union() {
            translate([0,0,1.49]) rotate([0,0,45]) cylinder(r1=10,r2=8,h=2, $fn=4);
            translate([0,0,1.5/2]) cube([10*sqrt(2),10*sqrt(2),1.5],center=true);
         }
         translate([-7,0,1.5]) cube([5,15,6],center=true);
      }
   }
}

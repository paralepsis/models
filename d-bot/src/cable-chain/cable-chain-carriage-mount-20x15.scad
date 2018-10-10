$fn=80;
thick=14;

new();

module new() {
   mirror([0,1,0]) difference() {
      union() {
         translate([-8,-20,0]) cube([40,39,thick]);
         hull() {
            translate([-8+20,0,0]) cube([20, 48, 5]);
            translate([-8,0,0]) cube([20, 31,5]);
            translate([-3,43,0]) cylinder(h=5,r=5);
         }

         translate([27,0,0]) rotate([90,0,90]) linear_extrude(height=5)
            polygon(points=[[19,0], [19,thick],[48,5], [48,0]]);
      }

      // translate([18,23,-0.5]) cylinder(d=4.2,h=10);
      translate([18,29,-0.5]) cylinder(d=4.2,h=10);
      translate([18,37,-0.5]) cylinder(d=4.2,h=10);

      // cutout for carriage wall
      translate([-9,-21,4]) cube([50,10,5.5]);

      translate([5,4-20,-1]) cylinder(d=3.2,h=20);
      translate([15,4-20,-1]) cylinder(d=3.2,h=20);

      translate([22,-25,-1]) cube([15,10,20]);
   }
}

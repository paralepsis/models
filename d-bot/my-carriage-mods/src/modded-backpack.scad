% translate([0,0,9.4]) import("orig/Carriage_Backpack_bridge.stl");

$fn=80;
thick=9.4;

new();

module new() {
   translate([33,110,0])
   rotate([0,0,180]) mirror([0,1,0]) difference() {
      intersection() {
        translate([0,0,-1]) hull() {
           translate([-5,45,0]) cylinder(h=11,r=3);
           translate([-5,-11,0]) cylinder(h=11,r=3);
           translate([29,-11,0]) cylinder(h=11,r=3);
           translate([29,45,0]) cylinder(h=11,r=3);
        }
        union() {
           translate([-8,-10,0]) cube([40,29,thick]);
           hull() {
              translate([-8+20,0,0]) cube([20, 48, 4]);
              translate([-8,0,0]) cube([20, 31,4]);
              translate([-3,43,0]) cylinder(h=4,r=5);
           }
  
           translate([-8,0,0]) rotate([90,0,90]) linear_extrude(height=5)
              polygon(points=[[19,0], [19,thick],[48,5], [48,0]]);
           translate([27,0,0]) rotate([90,0,90]) linear_extrude(height=5)
              polygon(points=[[19,0], [19,thick],[48,5], [48,0]]);
        }
      }

      // translate([18,23,-0.5]) cylinder(d=4.2,h=10);
      translate([6,29,-0.5]) cylinder(d=4.2,h=10);
      translate([6,37,-0.5]) cylinder(d=4.2,h=10);

      translate([12.62,-4.87,0]) translate([0,0,-0.5]) cylinder(d=10,h=10);
   }
}

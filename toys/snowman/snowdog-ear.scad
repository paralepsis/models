$fn = 50;

difference() {
   union() {
      rotate([0,6,0]) translate([0,0,1]) cylinder(r=10,h=20);
      hull() {
         rotate([0,6,0]) translate([0,0,1]) cylinder(r=10,h=12);
         rotate([0,0,-11]) translate([-28,-3,0]) form();
      }
   }
   rotate([0,6,0]) translate([0,0,3]) cylinder(d=7,h=30);
}


module form() {
   linear_extrude(height=5) scale([1.1,1.1,1.0]) hull() {
      translate([-4,5,0]) circle(r=23);
      translate([-19,-7,0]) circle(r=22);
      translate([-32,-0,0]) circle(r=14);
      translate([18,-7,0]) circle(r=25);
      translate([14,12,0]) circle(r=24);
   }
}

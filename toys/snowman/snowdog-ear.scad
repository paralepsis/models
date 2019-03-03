$fn = 50;

difference() {
   union() {
      cylinder(r=10,h=20);
      hull() {
         cylinder(r=10,h=12);
         translate([-3,0,0]) form();
      }
   }
   translate([0,0,3]) cylinder(d=7,h=30);
}


module form() {
   linear_extrude(height=5) hull() {
      translate([-4,5,0]) circle(r=23);
      translate([-19,-7,0]) circle(r=22);
      translate([-34,-2,0]) circle(r=11);
      translate([18,-7,0]) circle(r=25);
      translate([14,12,0]) circle(r=24);
   }
}

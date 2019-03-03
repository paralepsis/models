$fn = 50;

difference() {
   union() {
      cylinder(r=10,h=20);
      hull() {
         cylinder(r=10,h=12);
         form();
      }
   }
   translate([0,0,3]) cylinder(d=7,h=30);
}


module form() {
   hull() {
      translate([-20,-5,0]) linear_extrude(height=5) circle(r=13);
      translate([20,-5,0]) linear_extrude(height=5) circle(r=13);
      translate([0,8,0]) linear_extrude(height=5) circle(r=18);
   }
}

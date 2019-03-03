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
   linear_extrude(height=5) circle(r=20);
}

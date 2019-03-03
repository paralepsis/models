$fn = 50;

difference() {
   union() {
      translate([40,0,0]) cylinder(r=10,h=20);
      hull() {
         translate([40,0,0]) cylinder(r=10,h=12);
         form();
      }
   }
   translate([40,0,3]) cylinder(d=7,h=30);
}


module form() {
   difference() {
      translate([20,0,0]) linear_extrude(height=5) scale([3.6,1,1]) circle(r=25);
      translate([-200,-100,-10]) cube([180,200,20]);
   }
}

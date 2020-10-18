$fn=30;

include<./plate.scad>;

translate([0,0,-5]) import("./orig/miniMACRO5.stl");

module pcbPlus() {
   translate([-12.987,-11.087,0]) cube([12.987+89.187,11.087*2,1]);
   translate([-9.9,8,0]) cylinder(r=1.2,h=5);
   translate([-9.9,-8,0]) cylinder(r=1.2,h=5);
   translate([86.1,8,0]) cylinder(r=1.2,h=5);
   translate([86.1,-8,0]) cylinder(r=1.2,h=5);
}

module simpleBody() {
   linear_extrude(height=7.5)
      polygon(points=[[-16,-14],[-16,14],[92,14],[92,-14]]);

   translate([80,-5.5,-2.5]) cube([20,11,10.5]);
}


translate([-7.15-2.525+0.15,-7.15-2.525+0.15,-5]) miniHoles();

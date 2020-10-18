$fn=30;

translate([0,0,-5]) import("./orig/miniMACRO5.stl");

translate([-12.987,-11.087,0]) cube([12.987+89.187,11.087*2,1]);
translate([-9.9,8,0]) cylinder(r=1.2,h=5);
translate([-9.9,-8,0]) cylinder(r=1.2,h=5);
translate([86.1,8,0]) cylinder(r=1.2,h=5);
translate([86.1,-8,0]) cylinder(r=1.2,h=5);

translate([80,-5.5,-2.5]) cube([20,11,10.5]);

	

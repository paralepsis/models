$fn=20;

difference() {
   cube([20,20,10]);
   translate([10, 10, 10-6.8]) cylinder(d=5.2,h=6.9);
}

$fn=30;

difference() {
   cylinder(d=9,h=4);
   translate([0,0,.17*5]) cylinder(d=7.2,h=4);
   translate([0,0,-0.1]) cylinder(d=3.2,h=4);
}

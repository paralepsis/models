$fn=50;

translate([0,0,4.2]) rotate([0,180,0]) difference() {
   translate([0,-23,0.0]) scale([1.75,1.0,1]) cylinder(d=16.5,h=4.2);
   cutout();
}

module cutout() {
   translate([0,0,-0.1]) difference() {
      cylinder(d=55.2,h=3);
      translate([0,0,-0.1]) cylinder(d=39.8,h=4);
   }
}

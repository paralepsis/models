$fn=50;

difference() {
   hull() {
      translate([-4,-8,0]) corner();
      translate([4,-8,0]) corner();
      translate([4,8,0]) corner();
      translate([-4,8,0]) corner();
   }
   translate([-4.75,-8.75,0]) cutout();
   translate([4.75,-8.75,0]) cutout();
   translate([4.75,8.75,0]) cutout();
   translate([-4.75,8.75,0]) cutout();
}

module cutout() {
   difference() {
      translate([0,0,4]) cylinder(h=2,r=2);
      translate([0,0,3.5]) cylinder(h=4,r=1.5);
   }
}

module corner() {
   cylinder(h=4.3,r=5);
   translate([0,0,4.3]) cylinder(h=0.7,r1=5,r2=4.3);
}

$fn=50;

// 4mm tall, 14mm wide
// 3.25mm cylindrical post to go around.

translate([1,0,5.1]) rotate([0,90,0]) difference() {
   translate([0.1,-7,0]) cube([5,14,6]);
   cutouts();
}
translate([-1,0,4.1]) rotate([0,-90,0]) difference() {
   translate([-4.1,-7,0]) cube([4,14,6]);
   cutouts();
}

module cutouts() {
   // translate([0,0,-0.1]) cylinder(d=3.4,h=10);
   translate([0,0,-0.1]) cylinder(d=3.1,h=10);
   translate([-10,-4,3]) rotate([0,90,0]) cylinder(d=2.5,h=20);
   translate([1,-4,3]) rotate([0,90,0]) cylinder(d=3.25,h=10);
   translate([-10,4,3]) rotate([0,90,0]) cylinder(d=2.5,h=20);
   translate([1,4,3]) rotate([0,90,0]) cylinder(d=3.25,h=10);
}

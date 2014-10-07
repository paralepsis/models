
hull() {
	cylinder(r=3,h=0.3);
	translate([0,21,0]) cylinder(r=3,h=0.3);
}
translate([32,0,0]) hull() {
	cylinder(r=3,h=0.3);
	translate([0,21,0]) cylinder(r=3,h=0.3);
}

translate([0,6,0]) cube([34,10,0.3]);

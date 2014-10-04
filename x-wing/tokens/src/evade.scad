module evade() {

union() scale(1.1) {

translate([-1, 0.5, 0]) scale(1.1) difference() {
	cylinder(h = 1.5, r = 5.5, $fn = 80);
	translate([0, 0, -0.5]) cylinder(h = 10, r = 3.75, $fn = 80);
}


translate([-3.5, 4.5, 1.5]) scale([1, 1, 0.6]) sphere(r = 2.5, $fn = 40);
translate([-3.5, 4.5, 0]) linear_extrude(height = 1.5) projection(cut = true) {
	sphere(r = 2.5, $fn = 40);
}

translate([3.5, -3.5, 1.5]) scale([1, 1, 0.6]) sphere(r = 2.5, $fn = 40);
translate([3.5, -3.5, 0]) linear_extrude(height = 1.5) projection(cut = true) {
	sphere(r = 2.5, $fn = 40);
}

translate([-5.5, -4.5, 1.5]) scale([1, 1, 0.6]) sphere(r = 2.5, $fn = 40);
translate([-5.5, -4.5, 0]) linear_extrude(height = 1.5) projection(cut = true) {
	sphere(r = 2.5, $fn = 40);
}

scale([1.25, 1.5, 1.25]) translate([-2, -4, 0]) union() {

translate([0, -1, 0]) cube([2, 4, 2]);
difference() {
	translate([2, 3, 0]) cylinder(h = 2, r = 2, $fn = 30);
	translate([2, -1, -1]) cube([10, 10, 10]);
	translate([2, 3, -1]) rotate([0, 0, 42]) cube([10, 10, 10]);
}

translate([2, 3, 2]) rotate([0, 180, -45]) {
	cube([2, 3, 2]);
	difference() {
		translate([2, 3, 0]) cylinder(h = 2, r = 2, $fn = 30);
		translate([2, -1, -1]) cube([10, 10, 10]);
		translate([2, 3, -1]) rotate([0, 0, 42]) cube([10, 10, 10]);
	}
	translate([2, 3, 0]) rotate([0, 0, -45]) translate([-2, 0, 0]) cube([2, 3, 2]);
}

}

difference() {

translate([2.15, 10, 0]) rotate([-90, 0, 0]) {
	difference() {
		scale([1, 1.5, 1]) cylinder(h = 6, r1 = 3.5, r2 = 0, center = true, $fn = 60);
		translate([-100, 0, -100]) cube([200, 100, 200]);
	}
}
translate([-100, -100, 2.5]) cube([200, 200, 100]);

}

}

}

evade();

// cube([10, 10, 10]);
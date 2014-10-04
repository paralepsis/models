module stress() {

scale(1.4) union() {

for(i = [0:1]) {

union() mirror([0, i, 0]) {

	translate([-6, -5, 0]) {
		cube([2, 6, 1.5]);
		rotate([0, 0, -35]) {
			cube([3, 2, 1.5]);
			translate([3, 0, 0]) rotate([0, 0, 60]) {
				cube([11, 2, 1.5]);
				translate([11, 0, 0]) rotate([0, 0, (180-55-60)]) cube([2.5, 2, 1.5]);
			}
		}
	}
}

}

translate([4, 0, 1.5]) scale([1, 1, 0.6]) rotate([0, -90, 0]) {
	cylinder(h = 5.25, r1 = 2.5, r2 = 1.2, $fn = 60);
	translate([0, 0, 7.5]) scale([1.4, 1.1, 1]) sphere(r = 1.7, $fn = 60);
}

linear_extrude(height = 1.5) projection(cut = true) {
translate([4, 0, 0]) scale([1, 1, 0.6]) rotate([0, -90, 0]) {
	cylinder(h = 5.25, r1 = 2.5, r2 = 1.2, $fn = 20);
	translate([0, 0, 7.5]) scale([1.4, 1.1, 1]) sphere(r = 1.7, $fn = 60);
}
}

}

}

stress();

// cube(10, 10, 10);

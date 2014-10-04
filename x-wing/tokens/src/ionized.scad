module ionized() {

module flash() {
	translate([0.5, -3, 0]) scale([2.5, 2, 1.1]) rotate([0, 0, -12]) {
		linear_extrude(height = 2.5) {
			polygon([
				[-1.25, 0],
				[-0.75, -1],
				[-1.5, -1],
				[1, -4],
				[0.25, -1.5],
				[1, -1.5],
				[0.25, 0]
			]);
		}
	}
	// translate([-1, -5, 0]) cube([2, 5, 0.5]);
}

union() scale(1.1) {

for(i = [0:4]) {
	rotate([0, 0, i * (360 / 5)]) flash();
}

difference() {
	scale([1, 1, 0.9]) sphere(5, $fn = 60);
	translate([-100, -100, -100]) cube([200, 200, 100]);
}


difference() {
	cylinder(h = 0.75, r = 12, $fn = 80);
	translate([0, 0, -0.5]) cylinder(h = 10, r = 9, $fn = 80);
}

}

}

ionized();

// cube([10, 10, 10]);
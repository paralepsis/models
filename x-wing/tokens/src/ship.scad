module ship_shape(height) {
	linear_extrude(height) polygon([
		[-18, 0],
		[15, -7],
		[14, 0],
		[15, 7]
	]);
}

module ship() {
	difference() {
		union() {
			ship_shape(2);
			intersection() {
				ship_shape(20);
				translate([20, 0, 2]) scale([1, 1, 0.3]) rotate([0, -90, 0]) {
					cylinder(h = 40, r1 = 8, r2 = 0, $fn = 80);
				}
			}
		}
		translate([-20, -20, -20]) cube([7, 40, 40]);
	}
	translate([-13, 0, 0]) cylinder(r = 1.05, h = 2.2, $fn = 40);
	translate([-13, 0, 2.2]) scale([1, 1, 0.23]) sphere(r = 1.05, $fn = 40);
}

ship();
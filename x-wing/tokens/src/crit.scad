module crit() {

module bang() {
	polygon([
		[4, -1.5],
		[2, 1],
		[2.5, 5],
		[0, 2.5],
		[-3, 3],
		[-2, 0],
		[-3, -3],
		[0, -2],
		[2, -3.5],
		[2, -1.5]
	]);
}

scale(0.7) union() {

	scale(0.6) difference() {
		scale(3.2) linear_extrude(height = 3) bang();
		translate([0, 0, -10]) linear_extrude(height = 20) bang();
	}

	scale(1.5) rotate([0, 0, 45]) difference() {
		scale(1.8) linear_extrude(height = 1.5) bang();
		translate([0, 0, -10]) linear_extrude(height = 20) bang();
	}

	scale(2) rotate([0, 0, 85]) difference() {
		scale(1.8) linear_extrude(height = 0.5) bang();
		translate([0, 0, -10]) linear_extrude(height = 20) bang();
	}

}

}

crit();

// cube([10, 10, 10]);
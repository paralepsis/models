use <hexagonal_grid.scad>;

module shield() {

union() scale([0.8, 0.8, 0.6]) {

	intersection() {
		union() {
			scale(1.25) translate([-14, -20, 0]) {
				linear_extrude(height = 20) lattice(10, 10, 2);
			}
		}
		translate([0, 0, -1]) cylinder(r = 12, h = 50);
		translate([0, 0, 1.5]) scale([1, 1, 0.35]) sphere(11);
	}

	difference() {
		cylinder(h = 4, r = 15, $fn = 80);
		translate([0, 0, -0.5]) cylinder(h = 5, r = 11, $fn = 80);
		for(i = [0:9]) {
			rotate([0, 0, 36 * i]) translate([15, 0, -10]) {
				cylinder(h = 50, r = 2.5, $fn = 20);
			}
		}
	}

	union() {
		difference() {
			cylinder(h = 3, r = 12);
			translate([0, 0, 3]) scale([1, 1, 0.165]) sphere(11);
		}
		cylinder(h = 0.7/0.6, r = 12);
	}

}

}

shield();

// cube(10, 10, 10);

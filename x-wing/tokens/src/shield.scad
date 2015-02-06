// Modified to simplify design somewhat (removed domed top) -- RBR 2/5/2015

use <hexagonal_grid.scad>;

hexWidth = 2.0; // mm

module shield() {

union() scale([0.8, 0.8, 0.4]) {

	intersection() {
		union() {
			scale(1.24) translate([-14, -20, 0]) {
				linear_extrude(height = 20)
				   lattice(10, 10, hexWidth);
			}
		}
		translate([0, 0, -1]) cylinder(r = 12, h = 5);
		// translate([0, 0, -1]) cylinder(r = 12, h = 50);
		// translate([0, 0, 1.5]) scale([1, 1, 0.35]) sphere(11);
	}

	difference() {
		cylinder(h = 4, r = 15, $fn = 80);
		translate([0, 0, -0.5]) cylinder(h = 5, r = 10.8, $fn = 80);
		//translate([0, 0, -0.5]) cylinder(h = 5, r = 11, $fn = 80);
		for(i = [0:9]) {
			rotate([0, 0, 36 * i]) translate([15, 0, -10]) {
				cylinder(h = 50, r = 2.5, $fn = 20);
			}
		}
	}

	union() {
		difference() {
			cylinder(h = 2.5, r = 12);
			// cylinder(h = 3, r = 12);
			//translate([0, 0, 3]) scale([1, 1, 0.165]) sphere(11);
		}
		cylinder(h = 0.7/0.6, r = 12);
	}

}

}

shield();

// cube(10, 10, 10);

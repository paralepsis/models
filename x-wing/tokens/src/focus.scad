/*
 * Changes from Guido's original version:
 * - converted outline code to use iterator for simplicity of modification
 * - adjusted inside cylinder of eye from 9.5 to 9.2 rad to help with build
 * - adjusted inside cylinder of cornea from 3.5 to 3.1 rad to help with build
 */

module focus() {

/* outline of eye */
for (i=[0:1]) {
	rotate([0,0,180*i]) difference() {
		translate([-5.5, 0, 0]) difference() {
			cylinder(h = 2.5, r = 12, $fn = 90);
			translate([0, 0, -0.5]) cylinder(h = 10, r = 9.2, $fn = 80);
		}
		translate([-100, -100.00, -100]) cube([100, 200, 200]);
	}
}

difference() {
	cylinder(h = 3.5, r = 5.5, $fn = 80);
	translate([0, 0, -0.5]) cylinder(h = 10, r = 3.1, $fn = 80);
}

translate([-1.5, -1.5, 0]) {
	cylinder(h = 3, r = 2, $fn = 80);
}

rays = 16;

difference() {
	union() scale([1.1, 1.35, 1]) {
		for(i = [0:rays - 1]) {
			rotate([0, 0, ((360 / rays) / 2) + (i * (360 / rays))]) {
				linear_extrude(height = 1) {
					polygon([[-5, 0], [5, 0], [0, 9]]);
				}
			}
		}
	}
	union() {
		intersection() {
			translate([-5.5, 0, -1]) cylinder(h = 5, r = 11, $fn = 80);
			translate([5.5, 0, -1]) cylinder(h = 5, r = 11, $fn = 80);
		}
	}
}

}

focus();

// cube(10, 10, 10);

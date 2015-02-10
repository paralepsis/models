// Modified to simplify design somewhat (removed domed top) -- RBR 2/5/2015

use <hexagonal_grid.scad>;

hexWidth = 2.0; // mm


module shield() {

union() scale([0.8*0.95, 0.8*0.95, 0.4]) {

	color("white") scale(1.15) {
		translate([-5.25*hexWidth,-5*hexWidth,0])
		linear_extrude(height=4.0) 
		replacementLattice(10,10,hexWidth);
	}

	color("blue") difference() {
		cylinder(h = 3.5, r = 15.5, $fn = 80);
		for(i = [0:9]) {
			rotate([0, 0, 36 * i]) translate([15.6, 0, -10]) {
				cylinder(h = 50, r = 2.5, $fn = 20);
			}
		}
	}
}
}

shield();

// cube(10, 10, 10);

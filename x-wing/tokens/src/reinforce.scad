use <ship.scad>

module reinforce_rings() {
	scale([1, 1, 1.5]) for (i = [1 : 4]) {
		difference() {
			union() {
				cylinder(h = 2 - 0.2 * i, r = 2 + 3 * i, $fn = 60);
				translate([0, 0, 2 - 0.2 * i]) scale([1, 1, 0.3 * (1 / i)]) sphere(r = 2 + 3 * i, $fn = 60);
			}
			translate([0, 0, -10]) cylinder(h = 20, r = 3 * i, $fn = 60);
		}
	}
}

module reinforce_front() {
	scale(0.9) {
		ship();
		difference() {
			translate([-13, 0, 0]) {
				reinforce_rings();
			}
			translate([-100, -100, -100]) cube([200, 200, 100]);
		}
	}
}

module reinforce_back() {
	scale(0.9) {
		ship();
		difference() {
			translate([14, 0, 0]) {
				reinforce_rings();
			}
			translate([-100, -100, -100]) cube([200, 200, 100]);
		}
	}
}

translate([0, 15, 0]) reinforce_front();
translate([0, -15, 0]) reinforce_back();

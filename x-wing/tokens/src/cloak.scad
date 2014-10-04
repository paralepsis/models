use <ship.scad>

module cloak() {

	difference() {
		ship();
		translate([-18, -100, -1]) {
			for(i = [0 : 5]) {
				translate([i + i * 4.4, 0, 0]) {
					cube([3.3 - (i / 2), 200, 10]);
				}
			}
		}
	}
	difference() {
		translate([1.5, 0, 0]) scale([1.05, 0.65, 0.5]) ship();
		translate([-30, -20, -20]) cube([16, 40, 40]);
	}

	difference() {
		translate([0, 0, -1]) difference() {
			cylinder(h = 2, r = 12, $fn = 100);
			translate([0, 0, -0.5]) cylinder(h = 110, r = 8.5, $fn = 100);
		}
		translate([-100, -100, -100]) cube([200, 200, 100]);
	}

}

cloak();

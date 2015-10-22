use <ship.scad>

module cloak() {

	scale([0.9,0.9,0.9]) {
	difference() {
		scale([1.1,1.3,1.1]) ship();
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
			cylinder(h = 2.4, r = 13, $fn = 100);
			translate([0, 0, -0.5]) cylinder(h = 110, r = 9.7, $fn = 100);
		}
		translate([-100, -100, -100]) cube([200, 200, 100]);
	}
	}
}

cloak();

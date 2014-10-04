module electric_sheep() {

scale([0.8, 0.8, 1]) translate([0, -8, 0]) {
	difference() {
		union() {
			difference() {
				union() {
					translate([0, 0, 2]) scale([1, 1, 0.15]) sphere(r = 17, $fn = 80);
					linear_extrude(height = 2) projection(cut = true) sphere(r = 17, $fn = 80);
				}
				translate([-100, -100, -100]) cube([200, 101, 200]);
				translate([-100, 4, -100]) cube([200, 3, 200]);
				translate([-100, 8, 2]) cube([200, 1, 100]);
				translate([-100, 10, 2]) cube([200, 1, 100]);
			}
			translate([3, 5.5, 0]) cylinder(r = 2, h = 5, $fn = 80);
			translate([8, 5.5, 0]) cylinder(r = 2, h = 5, $fn = 80);
		}
		translate([-100, -100, -100]) cube([200, 200, 100]);
	}
}

}

electric_sheep();

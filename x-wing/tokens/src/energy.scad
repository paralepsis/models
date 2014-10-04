module energy() {

	scale([0.45, 0.45, 0.85]) difference() {
		union() {
			translate([0, 0, 2.5]) scale([1, 1, 0.5]) sphere(r = 8, $fn = 60);
			linear_extrude(height = 2.5) projection(cut = true) sphere(r = 8, $fn = 60);

			for(i = [0 : 2]) {
				rotate([0, 0, i * 120]) {
					translate([0, 0, -2]) {
						rotate([0, -5, 0]) difference() {
							cylinder(h = 6, r = 12.5, $fn = 80);
							rotate([0, 0, 37]) translate([-50, 0, -20]) cube([100, 40, 40]);
							rotate([0, 0, -37]) translate([-50, 0, -20]) cube([100, 40, 40]);
						}
						rotate([0, 4, 0]) difference() {
							cylinder(h = 5.5, r = 17, $fn = 80);
							rotate([0, 0, 46]) translate([-50, 0, -20]) cube([100, 40, 40]);
							rotate([0, 0, -46]) translate([-50, 0, -20]) cube([100, 40, 40]);
						}
						rotate([0, -10, 0]) difference() {
							cylinder(h = 6, r = 22, $fn = 80);
							rotate([0, 0, 65]) translate([-50, 0, -20]) cube([100, 40, 40]);
							rotate([0, 0, -65]) translate([-50, 0, -20]) cube([100, 40, 40]);
						}
						difference() {
							rotate([0, 3, 0]) difference() {
								cylinder(h = 6.5, r = 24.3, $fn = 100);
								rotate([0, 0, 40]) translate([-50, 0, -20]) cube([100, 40, 40]);
								rotate([0, 0, -40]) translate([-50, 0, -20]) cube([100, 40, 40]);
							}
							cylinder(r = 20, h = 50, $fn = 100);
						}
					}
				}
			}
		}
		translate([-100, -100, -100]) cube([200, 200, 100]);
	}


}

energy();
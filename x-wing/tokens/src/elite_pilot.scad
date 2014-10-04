module elite_pilot() {

xyscale = 0.75;

scale ([xyscale, xyscale, 1]) difference() {
	union() {
		translate([0, -10, 0]) {
			translate([0, 0, 2]) scale([1, 1, 0.2]) sphere(r = 5.75, $fn = 60);
			linear_extrude(height = 2) projection(cut = true) sphere(r = 5.75, $fn = 60);
		}
		difference() {
			union() {
				linear_extrude(height = 2.5) {
					polygon([
						[-2, -7],
						[2, -7],
						[3, 13],
						[-3, 13]
					]);
					for(axis = [0:1]) mirror([axis,0,0]) polygon([
						[3, -7],
						[9, -3],
						[11, 13],
						[5, 13]
					]);
				}
				linear_extrude(height = 3) {
					polygon([
						[-1.5, -6.5],
						[1.5, -6.5],
						[2.5, 12.5],
						[-2.5, 12.5]
					]);
					for(axis = [0:1]) mirror([axis,0,0]) polygon([
						[3.5, -6.5],
						[8.75, -2.75],
						[10.5, 12.5],
						[5.5, 12.5]
					]);
				}
			}
			translate([0, -10, -10]) {
				linear_extrude(height = 20) projection(cut = true) sphere(r =7, $fn = 60);
			}
		}
		translate([-12, 13, 0]) cube([24, 1, 3]);
		translate([-12.5, 14, 0]) cube([25, 1, 3.5]);
		translate([-12, 15, 0]) cube([24, 1, 3]);
		translate([0, -10, 0]) for(i = [0 : 10]) {
			rotate([0, 0, i * 36]) {
				linear_extrude(height = 2.5) polygon([
					[-5, 0],
					[0, 9],
					[5, 0]
				]);
			}
			rotate([0, 0, i * 36 + 18]) {
				linear_extrude(height = 3) polygon([
					[-2, 0],
					[0, 5.5],
					[2, 0]
				]);
			}
		}
	}
	translate([-100, -100, -100]) cube([200, 200, 100]);
}

}

elite_pilot();

// cube([10, 10, 10]);
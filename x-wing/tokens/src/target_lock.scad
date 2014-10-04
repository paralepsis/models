include <spiff.scad>

lock_number_strings = ["1", "2", "3", "4", "5", "6", "7", "8", "9"];
lock_number_widths  = [5, 6, 6, 6, 6, 6, 5, 6, 6];
lock_number_heights = [10, 10, 10, 10, 10, 10, 10, 10, 10];

target_lock(0);

module target_lock(index) {

difference() {
	cylinder(h = 2, r = 7, $fn = 80);
	translate([0, 0, -0.5]) cylinder(h = 10, r = 5, $fn = 80);
}

scale([1.4, 1.1, 0.9]) {
translate([
	-(lock_number_widths[index] / 2),
	-(lock_number_heights[index] / 2),
	0
])
{
	linear_extrude(height = 4.75) {
		write(lock_number_strings[index]);
	}
}
}

difference() {
	union() {
		translate([-18.5, -1.5, 0]) {
			cube([37, 3, 1.5]);
			translate([0, 1.5, 1.5]) rotate([0, 90, 0]) cylinder(h = 37, r = 1.5, $fn = 40);
		}
		translate([-1.5, -16, 0]) {
			cube([3, 32, 1.5]);
			translate([1.5, 0, 1.5]) rotate([-90, 0, 0]) cylinder(h = 32, r = 1.5, $fn = 40);
		}
	}
	translate([0, 0, -1]) cylinder(h = 10, r = 5);
}

for (quadrant = [0:3]) for (grid = [0:4]) {
	rotate([0, 0, quadrant * 90]) {
		translate([5 + (2.5 * grid), -3, 0]) cube([1, 6, 2]);
	}
}
translate([-19, -5, 0]) cube([2, 10, 3]);
translate([17.5, -5, 0]) cube([2, 10, 3]);
translate([-5, -17, 0]) cube([10, 2, 3]);
translate([-5, 14.5, 0]) cube([10, 2, 3]);

}

// cube([10, 10, 10]);
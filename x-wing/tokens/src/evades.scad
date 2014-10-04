/*
 * NOTES:
 * - rotated by 90 degrees, adjusted spacing, to better fit my build plate.
 */
use <focus.scad>;

for(x = [0:5]) { translate([-75 + (x * 30), 0, 0]) {
	for (y = [0:3]) {
		translate([0,  90 - (y * 25), 0]) rotate([0,0,90]) focus();
	}
} }

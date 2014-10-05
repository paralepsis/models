/*
 * NOTES:
 */
use <stress.scad>;

for(x = [0:5]) { translate([-55 + (x * 22), 0, 0]) {
	for (y = [0:3]) {
		translate([0,  40 - (y * 22), 0]) rotate([0,0,90]) stress();
	}
} }

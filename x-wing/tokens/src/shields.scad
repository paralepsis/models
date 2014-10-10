/*
 * NOTES:
 */
use <shield.scad>;

for(x = [0:6]) { translate([-55 + (x * 25), 0, 0]) {
	for (y = [0:3]) {
		translate([0,  40 - (y * 25), 0]) rotate([0,0,90]) shield();
	}
} }

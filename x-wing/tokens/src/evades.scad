/*
 * NOTES:
 */
use <evade.scad>;

for(x = [0:5]) { translate([-75 + (x * 28), 0, 0]) {
	for (y = [0:3]) {
		translate([0,  90 - (y * 22), 0]) rotate([0,0,90]) evade();
	}
} }

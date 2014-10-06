/*
 * NOTES:
 */
use <cloak.scad>;

for(x = [0:5]) { translate([-75 + (x * 35), 0, 0]) {
	for (y = [0:3]) {
		translate([0,  90 - (y * 30), 0]) rotate([0,0,00]) cloak();
	}
} }

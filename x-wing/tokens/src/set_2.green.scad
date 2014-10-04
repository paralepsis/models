use <focus.scad>
use <evade.scad>

for (y = [0 : 1]) {
	for (x = [0 : 3]) {
		translate([-45 + (y * 30), -45 + (x * 30), 0]) focus();
		translate([45 - (y * 30), -45 + (x * 30), 0]) evade();
	}
}

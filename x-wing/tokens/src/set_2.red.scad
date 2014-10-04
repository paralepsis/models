use <ionized.scad>
use <crit.scad>
use <target_lock.scad>
use <stress.scad>

for (z = [0 : 1]) {
	for (x = [0 : 2]) {

		translate([-25, x * 30 - 45, z * 15]) ionized();
		translate([25, x * 30 - 45, z * 15]) crit();
		for (y = [0 : 1]) {
			translate([y * 50 - 25, x * 30 - 45, 30 + z * 15]) stress();
		}

	}
}

for (i = [0 : 5]) {
	translate([-50 + ((i % 3) * 50), -25 + ((i % 2) * 50), 60]) target_lock(i);
}

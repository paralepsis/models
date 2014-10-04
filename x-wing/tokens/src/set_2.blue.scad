use <target_lock.scad>
use <shield.scad>

for (y = [0 : 3]) {
	for (x = [0 : 2]) {
		for (z = [0 : 1]) {
			translate([y * 30 - 45, x * 30 - 30, z * 15]) shield();
		}
	}
}

for (i = [0 : 5]) {
	translate([-50 + ((i % 3) * 50), -25 + ((i % 2) * 50), 30]) target_lock(i);
}

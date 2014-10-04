use <target_lock.scad>

for(x = [0:3]) { translate([-75 + (x * 50), 0, 0]) {
	for (index = [0:5]) {
		translate([0,  100 - (index * 40), 0]) target_lock(index);
	}
} }

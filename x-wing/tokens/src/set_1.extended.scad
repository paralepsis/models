use <electric_sheep.scad>
use <elite_pilot.scad>
use <cloak.scad>
use <energy.scad>
use <reinforce.scad>

for (i = [0 : 1]) {
	translate([-90, -75 + 50 * i, 0]) reinforce_front();
	translate([-100, 25 + 50 * i, 0]) reinforce_back();
}
for (i = [0 : 3]) translate([-70, -100 + 50 * i, 0]) cloak();
for (i = [0 : 3]) translate([-40, -75 + 50 * i, 0]) elite_pilot();
for (i = [0 : 3]) translate([-20, -100 + 50 * i, 0]) electric_sheep();
for (x = [0 : 3]) for (y = [0 : 5]) if (x < 3 || y < 4) {
	translate([10 + x * 30, -120 + x * 20 + y * 40, 0]) energy();
}
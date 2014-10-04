use <ionized.scad>
use <crit.scad>
use <target_lock.scad>
use <focus.scad>
use <evade.scad>
use <shield.scad>
use <stress.scad>

for (offset = [0 : 1]) translate([offset * 25, offset * 25, 0]) {

	for (x = [0 : 2]) translate([-50, (x * 50), 0]) ionized();
	for (x = [0 : 2]) translate([0, (x * 30), 0]) crit();
	for (x = [0 : 3]) translate([50, (x * 35), 0]) stress();
	for (x = [3 : 4]) translate([0, (x * 30), 0]) stress();

	for (y = [0 : 1]) for (x = [0 : 4]) translate([-100 - (y * 50), -100 + (x * 50), 0]) shield();
	for (y = [0 : 1]) translate([100 + (y * 50), 100, 0]) shield();

	for (x = [0 : 3]) translate([100, -100 + (x * 50), 0]) focus();
	for (x = [0 : 3]) translate([150, -100 + (x * 50), 0]) evade();

	for (i = [0 : 5]) translate([-50 + ((i % 3) * 50), -50 - ((i % 2) * 50), 0]) target_lock(i);

}

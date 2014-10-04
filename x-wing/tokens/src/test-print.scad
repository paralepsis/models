use <electric_sheep.scad>
use <elite_pilot.scad>
use <cloak.scad>
use <energy.scad>
use <reinforce.scad>

use <ionized.scad>
use <crit.scad>
use <target_lock.scad>
use <focus.scad>
use <evade.scad>
use <shield.scad>
use <stress.scad>

my_color = "red";

if (my_color == "red") {
	translate([-20, -20, 0]) ionized();
	translate([-20, 20, 0]) target_lock(0);
	translate([20, -20, 0]) crit();
	translate([20, 20, 0]) stress();
}

if (my_color == "green") {
	translate([-20, -20, 0]) reinforce_front();
	translate([-20, 20, 0]) reinforce_back();
	translate([20, -20, 0]) focus();
	translate([20, 20, 0]) evade();
}

if (my_color == "blue") {
	translate([-20, 0, 0]) shield();
	translate([20, 0, 0]) target_lock(0);
}

if (my_color == "purple") {
	translate([-20, 0, 0]) cloak();
	translate([20, 0, 0]) energy();
}

if (my_color == "yellow") {
	translate([-20, 0, 0]) elite_pilot();
	translate([20, 0, 0]) electric_sheep();
}

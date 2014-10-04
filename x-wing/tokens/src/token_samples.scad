use <ionized.scad>
use <crit.scad>
use <target_lock.scad>
use <focus.scad>
use <evade.scad>
use <shield.scad>
use <stress.scad>

translate([-50, -50, 0]) ionized();
translate([-50, 0, 0]) crit();
translate([-50, 50, 0]) target_lock(0);
translate([0, -50, 0]) focus();
translate([0, 0, 0]) evade();
translate([0, 50, 0]) shield();
translate([50, 0, 0]) stress();

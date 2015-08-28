/* Thor "badges" -- armor plates on costume.
 *
 * Copyright (C) Robert B. Ross, 2015
 *
 * This software is released under the Creative Commons
 * Attribution-ShareAlike 4.0 International Public License.
 *
 * Notes:
 * - Sizes ought to be 4", 3", and 2.5" diameters.
 * - Heights were 100%, 100%, 85% respectively.
 * - Units for model are mm; 1 in = 25.4 mm
 */

$fn=200;
$mm = 25.4;
$cutFract = 0.77;
$centerHt = 0.75;
$cutOff = 4.3; /* this is the translation in the Z axis of the cutout,
                * needs to be 4.3mm for the 2" radius badge.
                */

scale([2.5/4, 2.5/4, 0.85]) badge($rad=2.*$mm);

module badge($rad=2*$mm) {
    difference() {
        /* body of badge/plate, with slightly raised center (?) */
        intersection() {
            union() {
                intersection() {
                    translate([0,0,$centerHt])scale([1,1,0.2]) sphere(r= $rad);
                    cylinder(r= $cutFract * $rad - 1, h=20);
                }
                translate([0,0,0.3]) scale([1,1,0.2]) sphere(r= $rad);
                cylinder(r = $rad, h=0.3);
            }
            cylinder(r = $rad+1, h=20);
        }

        /* circle and little offshoots to be cut out */
        translate([0,0,$cutOff]) {
            difference() {
                cylinder(r=$cutFract * $rad,h=40);
                translate([0,0,-0.5]) cylinder(r=$cutFract * $rad - 2,h=41);
            }

            for ($i = [0:9]) {
                rotate([0,0,$i* 360/10])
                    translate([-1.5,$cutFract * $rad - 0.1, 0])
                        cube([3,10,41]);
            }
        }
    }
}
 
/*
 * Local variables:
 *  mode: C
 *  c-indent-level: 4
 *  c-basic-offset: 4
 * End:
 */

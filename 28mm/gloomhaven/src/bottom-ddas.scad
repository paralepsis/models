/*
 * Special version of ring for use on models like the DDAS snakes that
 * cannot really work with the raised and tilted spots for numbers.
 * This one is meant to be plasti-tack'd to the bottom of the model.
 */

$fn=120;
rad = 25/2+0.0;
ht  = 4;
angle = 25;

% translate([0,0,3.5]) ringDDAS();
eliteDDAS();

module eliteDDAS() {
   difference() {
      linear_extrude(height=3.0) projection() ringDDAS();

      /* magnets? */
      for (i=[0:1]) {
         rotate([0,0,i*180]) translate([rad+1.45,0,1.8]) cylinder(h=5,d=2.2);
      }
   }
}

module ringDDAS() {
   difference() {
      union() {
         hull() {
            for (i=[0:1]) {
               rotate([0,0,i*180]) translate([rad+1.6,-3.5,-1.0]) rotate([0,-1*angle,0]) cube([2,7,ht+1]);
            }
            cylinder(h=ht, r=rad+1.6);
         }
      }

      /* cut down to base shape */
      /* note: thicker inner ring than ring-2, trying magnet idea */
      translate([0,0,1.21]) cylinder(h=10,r=rad+0.4);
      translate([0,0,-0.1]) cylinder(h=10,r=rad-1.5);
      translate([0,0,ht]) cylinder(h=10,r=rad+5);
      translate([0,0,-2]) cylinder(h=2,r=rad+5);

   }
}

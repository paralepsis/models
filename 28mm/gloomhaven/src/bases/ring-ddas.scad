/*
 * Special version of ring for use on models like the DDAS snakes that
 * cannot really work with the raised and tilted spots for numbers.
 * This one is meant to be plasti-tack'd to the bottom of the model.
 */

$fn=120;
rad = 25/2+0.0;
ht  = 4;
angle = 25;

circleSlop = 0.3;

postRad = 0.85; /* was 0.75 */

// % translate([0,0,0]) ring2();
// elite();
ringDDAS();

// color("red") cylinder(h=4,d=25);

module ringDDAS() {
   difference() {
      union() {
         hull() {
            for (i=[0:1]) {
               rotate([0,0,i*180]) translate([rad+1.6,-3.5,-1.0]) rotate([0,-1*angle,0]) cube([2,7,ht+1]);
            }
            // cylinder(h=0.91+1.5, r=rad+1.6);
            cylinder(h=ht, r=rad+1.6);
         }
      }

      /* cut down to base shape */
      /* note: thicker inner ring than ring-2, trying magnet idea */
      translate([0,0,1.21]) cylinder(h=10,r=rad+circleSlop);
      translate([0,0,ht]) cylinder(h=10,r=rad+5);
      translate([0,0,-2]) cylinder(h=2,r=rad+5);

      /* no reason to cut all the way through */
      // translate([0,0,-0.1]) cylinder(h=10,r=rad-1.5);

      /* magnets */
      for (i=[0:1]) {
         rotate([0,0,i*180]) translate([rad+1.45,0,-0.1]) cylinder(h=1.3,d=2.2);
      }
   }

   for (i=[0:7]) {
      rotate([0,0,360/8*i+22.5]) translate([rad+0.70,0,0]) cylinder(h=ht,r=postRad);
   }
}

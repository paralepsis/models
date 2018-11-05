/* cap.scad
 *
 * This is a quick hack to get a cap for Raj.
 * 
 * Notes:
 * - When difference()ing things, it's helpful for the thing being "cut out"
 *   not to have a surface aligned with the thing being cut. Will get cleaner
 *   results if we avoid this (e.g., cutting out the center of the body).
 * - May want to build some angle under the notches so that they print more
 *   cleanly, although a little support ought to also do the trick.
 * - I did 2mm thick walls, but there's no reason why they couldn't be 1mm.
 *   These will just be more sturdy.
 */

$fn=80; /* this has to do with how many segments circles/arcs are split into. */

/* main body. 2mm thick walls because it shouldn't matter */
difference() {
   cylinder(r1=10,r2=11,h=15); /* main form */
   translate([0,0,1]) cylinder(r1=8,r2=9,h=14.1); /* cutout the center */

   /* for fun */
   for (i = [0:30:360]) {
      rotate([0,4,i]) translate([10.5,0,-0.1]) scale([0.6,1,1]) cylinder(r=2,h=16);
   }
}

/* add notches */
difference() {
   intersection() {
      cylinder(r1=9,r2=10,h=15); /* main form */
      translate([0,0,14.5]) cube([20,2,1],center=true); /* long cube @14-15mm */
   }
   cylinder(r=8,h=16); /* cut out the interior, leaving the notches */
}

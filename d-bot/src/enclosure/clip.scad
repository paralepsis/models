$fn=80;

bottomLip = 0;
thick = 4; /* minimum 4 */
gap = 6.25;
magnetDepth = 3;
magnetDia = 8.25; /* include any slop */
len = 25;


/* note: need 4mm of thickness of form for 10mm bolts to work */
/* note: this file is a total mess. not sure how it got to this point. */

difference() {
   translate([-8,0,2]) hull() {
      totalThick = 2*thick + gap;
      translate([16,0,0]) rotate([-90,0,0]) cylinder(r=2,h=totalThick);
      translate([0,0,0]) rotate([-90,0,0]) cylinder(r=2,h=totalThick);
      translate([16,0,len-4 + 2*bottomLip ]) rotate([-90,0,0]) cylinder(r=2,h=totalThick);
      translate([0,0, len-4 + 2*bottomLip]) rotate([-90,0,0]) cylinder(r=2,h=totalThick);
   }

   /* cutout for magnet */
   translate([0,magnetDepth, 11]) rotate([90,0,0]) cylinder(d=magnetDia, h=20);

   translate([-12.5,thick,4]) cube([25,gap,len]);
}


$fn=80;

difference() {
   hull() for (i=[0:3]) {
      translate([(floor(i / 2)) ? 91 : -91, (i % 2) ? 89/2 : -89/2, 0])
          cylinder(r1=5.15,r2=3,h=31.5);
   }

   /* bottom cutout */
   translate([-92/2,0,0]) hull() for (i=[0:3]) {
      translate([(floor(i / 2)) ? 40/2 : -40/2, (i % 2) ? 40/2 : -40/2, 0])
          translate([0,0,-1]) cylinder(r=8,h=6);
   }

   translate([92/2,0,0]) hull() for (i=[0:3]) {
      translate([(floor(i / 2)) ? 40/2 : -40/2, (i % 2) ? 40/2 : -40/2, 0])
          translate([0,0,-1]) cylinder(r=8,h=6);
   }

   /* card space */
   translate([92/2,0,53.5]) cube([89,89,100], center=true);
   translate([-92/2,0,53.5]) cube([89,89,100], center=true);

   /* space for fingers to access */
   translate([-92/2,0,18+3.5]) rotate([90,0,0]) cutout();
   translate([92/2,0,18+3.5]) rotate([90,0,0]) cutout();
   translate([0,0,18+3.5]) rotate([0,0,90]) rotate([90,0,0]) cutout();
}


module cutout() {
   translate([0,30,0]) cube([36,60,300],center=true);
   translate([0,0,-150]) cylinder(r=18,h=300);
}
